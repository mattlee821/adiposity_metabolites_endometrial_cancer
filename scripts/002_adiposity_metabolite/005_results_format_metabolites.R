rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

library(dplyr)

# format metabolites
metab <- read.table("adiposity_metabolites_endometrial_cancer/data/metabolite_labels.txt", header = T, sep = "\t")
## bmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int_imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## whr ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int_imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


## whradjbmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int_imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

