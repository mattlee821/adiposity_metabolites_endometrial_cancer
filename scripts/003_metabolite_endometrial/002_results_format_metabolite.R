rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

library(dplyr)

# format metabolites
metab <- read.table("adiposity_metabolites_endometrial_cancer/data/metabolite_labels.txt", header = T, sep = "\t")
## data ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int_imputed.txt_snps.txt*", "", data$exposure)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")

# OR and CI
data$OR <- exp(data$b)
data$lower_ci <- data$b - (1.96 * data$se)
data$lower_ci <- exp(data$lower_ci)
data$upper_ci <- data$b + (1.96 * data$se)
data$upper_ci <- exp(data$upper_ci)

# save
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
