rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

## bmi -> endometrial ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/001_MR_results.txt", header = T, sep = "\t")
data <- subset(data, method == "Inverse variance weighted (multiplicative random effects)")
data$outcome[data$outcome == "Endometrial cancer || id:ebi-a-GCST006464"] <- "Endometrial cancer"
data$outcome[data$outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465"] <- "Endometrioid cancer"
data$outcome[data$outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466"] <- "Non-endometrioid cancer"
data$adjusted[data$exposure == "BMI"] <- "BMI"
data$adjusted[data$exposure == "WHR"] <- "WHR"
data$adjusted[data$exposure == "WHRadjBMI"] <- "WHRadjBMI"
data$group <- "Adiposity on cancer"
data$method <- "Two Sample MR"
adiposity_cancer <- data[,c("exposure", "outcome", "group", "adjusted", "method", "b", "se", "pval")]

## metabolite -> endometrial ====
associated_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites.txt", header = T, sep = "\t")
associated_metabolites <- associated_metabolites[,1]
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/mr_results_formatted.txt", header = T, sep = "\t")
data <- data[data$UKB_label %in% associated_metabolites,]
data <- subset(data, method == "Inverse variance weighted (multiplicative random effects)")
data$outcome[data$outcome == "Endometrial cancer || id:ebi-a-GCST006464"] <- "Endometrial cancer"
data$outcome[data$outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465"] <- "Endometrioid cancer"
data$outcome[data$outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466"] <- "Non-endometrioid cancer"
data$group <- "Metabolite on cancer"
data$method <- "Two Sample MR"
data$exposure <- gsub("_int_imputed.txt_snps.txt", "", data$exposure)
data$exposure = gsub("_", "", data$exposure)
data$exposure = gsub("%", "pct", data$exposure)
data$exposure = gsub("-", "", data$exposure)
data$exposure = tolower(data$exposure)
data$adjusted <- data$UKB_label
metabolites_cancer <- data[,c("exposure", "outcome", "group", "adjusted", "method", "b", "se", "pval")]

## mvmr ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/combined_results.txt", header = T, sep = "\t")
data$outcome[data$outcome == "endometrioid_cancer"] <- "Endometrioid cancer"
data$outcome[data$outcome == "non_endometrioid_cancer"] <- "Non-endometrioid cancer"

## negative ontrol
negative_control <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/negative_control_mvmr_results_formatted.txt", header = T, sep = "\t")
negative_control$outcome[negative_control$outcome == "endometrioid_cancer"] <- "Endometrioid cancer"
negative_control$outcome[negative_control$outcome == "non_endometrioid_cancer"] <- "Non-endometrioid cancer"

## combine ====
data <- bind_rows(adiposity_cancer,metabolites_cancer,data,negative_control)

## format ====
my_files <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/adiposity/whradjbmi/", pattern = "*txt")
my_files <- gsub("_int_imputed.txt", "", my_files)
my_files = gsub("_", "", my_files)
my_files = gsub("%", "pct", my_files)
my_files = gsub("-", "", my_files)
my_files = tolower(my_files)
data$adjusted <- factor(data$adjusted, levels = c("BMI", "WHR", "WHRadjBMI", my_files))

data$method <- factor(data$method, levels = c("Two Sample MR", "Multivariable MR", "Negative control MVMR"))

data$OR <- exp(data$b)
data$lower_ci <- exp(data$b - (1.96 * data$se))
data$upper_ci <- exp(data$b + (1.96 * data$se))

## save ====
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_results.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


