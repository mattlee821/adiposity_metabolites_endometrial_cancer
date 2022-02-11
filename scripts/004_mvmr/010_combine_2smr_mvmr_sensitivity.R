rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

## associated metabolites -> endometrial ====
associated_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites.txt", header = T, sep = "\t")
associated_metabolites <- associated_metabolites[,1]

# MR adiposity sensitivity ====
adiposity_sensitivity <- read.table("adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/exposure_data.txt", header = T, sep = "\t")
adiposity_sensitivity <- unique(adiposity_sensitivity[,c("exposure", "mean_fstat")])
adiposity_sensitivity$method <- "Two-sample MR"

# MR metabolite sensitivity ====
metabolite_sensitivity <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/exposure_data.txt", header = T, sep = "\t")
metabolite_sensitivity$exposure <- gsub("_int_imputed.txt_snps.txt", "", metabolite_sensitivity$exposure)
metabolite_sensitivity$exposure = gsub("_", "", metabolite_sensitivity$exposure)
metabolite_sensitivity$exposure = gsub("%", "pct", metabolite_sensitivity$exposure)
metabolite_sensitivity$exposure = gsub("-", "", metabolite_sensitivity$exposure)
metabolite_sensitivity$exposure = tolower(metabolite_sensitivity$exposure)
metabolite_sensitivity <- metabolite_sensitivity[metabolite_sensitivity$exposure %in% associated_metabolites,]
metabolite_sensitivity$fstat <- (metabolite_sensitivity$beta.exposure / metabolite_sensitivity$se.exposure)^2
metabolite_sensitivity <- 
  metabolite_sensitivity %>%
  group_by(exposure) %>%
  summarise(mean_fstat = mean(fstat))
metabolite_sensitivity$method <- "Two-sample MR"

# combine ====
mr_sensitivity <- bind_rows(adiposity_sensitivity,metabolite_sensitivity)
mr_sensitivity$adjusted <- mr_sensitivity$exposure

# mvmr sensitivity ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/combined_sensitivity.txt", header = T, sep = "\t")
mvmr_fstat <- data[,c("exposure", "outcome", "adjusted", "fstat.exposure1", "method")]
colnames(mvmr_fstat)[4] <- "mean_fstat"

# combine sensitivity
sensitivity <- bind_rows(adiposity_sensitivity, metabolite_sensitivity, mvmr_fstat)
write.table(sensitivity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_fstats.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
