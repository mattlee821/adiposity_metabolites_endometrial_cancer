rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

mvmr_fstat <- mvmr_sensitivity[,c("exposure", "outcome", "group", "fstat.exposure1", "method")]
mvmr_fstat$exposure <- paste(mvmr_fstat$group,mvmr_fstat$outcome)
mvmr_fstat <- mvmr_fstat[,c("exposure", "fstat.exposure1", "method")]
colnames(mvmr_fstat)[2] <- "mean_fstat"


adiposity_sensitivity <- read.table("adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/exposure_data.txt", header = T, sep = "\t")
adiposity_sensitivity <- unique(adiposity_sensitivity[,c("exposure", "mean_fstat")])
adiposity_sensitivity$method <- "Two-sample MR"

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

sensitivity <- bind_rows(adiposity_sensitivity, metabolite_sensitivity, mvmr_fstat)










metabolites <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/adiposity/bmi/", pattern = "*txt")
metabolites <- gsub("_int_imputed.txt", "", metabolites)
metabolites <- gsub("_", "", metabolites)
metabolites <- gsub("%", "pct", metabolites)
metabolites <- gsub("-", "", metabolites)
metabolites <- tolower(metabolites)

data$method <- factor(data$method, levels = c("Two Sample MR", "Multivariable MR"))
data$adjusted <- factor(data$adjusted, levels = c("BMI", "WHR", "WHRadjBMI", metabolites))
data$OR <- exp(data$b)
data$lower_ci <- data$OR - (1.96 * data$se)
data$upper_ci <- data$OR + (1.96 * data$se)

