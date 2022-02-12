rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

library(dplyr)

# format metabolites
metab <- read.table("adiposity_metabolites_endometrial_cancer/data/metabolite_labels.txt", header = T, sep = "\t")

# female ====
## bmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/bmi/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int_imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/bmi/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## whr ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/whr/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int_imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/whr/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## whradjbmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/whradjbmi/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int_imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/whradjbmi/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")



# combined ====
## bmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/bmi/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int.imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/bmi/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## whr ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/whr/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int.imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/whr/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## whradjbmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/whradjbmi/mr_results.txt", header = T, sep = "\t")
data$metabolite <- sub("_int.imputed.txt_adiposity_instruments.txt*", "", data$outcome)
data$metabolite = gsub("_", "", data$metabolite)
data$metabolite = gsub("%", "pct", data$metabolite)
data$metabolite = gsub("-", "", data$metabolite)
data$metabolite = tolower(data$metabolite)
data$UKB_label <- data$metabolite
data <- left_join(data, metab, by = "UKB_label")
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/whradjbmi/mr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

