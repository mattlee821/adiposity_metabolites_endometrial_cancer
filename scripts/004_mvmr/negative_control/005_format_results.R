rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

# female ====
# negative control ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/combined/negative_control_female.txt", header = T, sep = "\t")

data$exposure[data$exposure == "bmi"] <- "BMI"
data$exposure[data$exposure == "bmi_whr"] <- "WHR"
data$outcome[data$outcome == "endometrial_cancer"] <- "Endometrial cancer"
data$outcome[data$outcome == "endometroid"] <- "Endometroid"
data$outcome[data$outcome == "non_endometroid"] <- "Non-endometroid"
data$adjusted[data$exposure == "BMI" & data$group == "bmi_whr"] <- "WHR"
data$adjusted[data$exposure == "WHR" & data$group == "bmi_whr"] <- "BMI"
data$method <- "Negative control MVMR"

## results ====
mvmr_result <- data[,c("exposure", "outcome", "group", "adjusted", "method", "b", "se", "p")]
colnames(mvmr_result)[8] <- "pval"
write.table(mvmr_result, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/combined/negative_control_mvmr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## sensitivity ====
mvmr_sensitivity <- data[,c("exposure", "outcome", "group", "adjusted", "method", "fstat.exposure1", "fstat.exposure2", "Qstat", "Qpval")]
write.table(mvmr_sensitivity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/combined/negative_control_mvmr_sensitivity_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")



# combined ====
# negative control ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/negative_control_combined.txt", header = T, sep = "\t")

data$exposure[data$exposure == "bmi"] <- "BMI"
data$exposure[data$exposure == "bmi_whr"] <- "WHR"
data$outcome[data$outcome == "endometrial_cancer"] <- "Endometrial cancer"
data$outcome[data$outcome == "endometroid"] <- "Endometroid"
data$outcome[data$outcome == "non_endometroid"] <- "Non-endometroid"
data$adjusted[data$exposure == "BMI" & data$group == "bmi_whr"] <- "WHR"
data$adjusted[data$exposure == "WHR" & data$group == "bmi_whr"] <- "BMI"
data$method <- "Negative control MVMR"

## results ====
mvmr_result <- data[,c("exposure", "outcome", "group", "adjusted", "method", "b", "se", "p")]
colnames(mvmr_result)[8] <- "pval"
write.table(mvmr_result, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/negative_control_mvmr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## sensitivity ====
mvmr_sensitivity <- data[,c("exposure", "outcome", "group", "adjusted", "method", "fstat.exposure1", "fstat.exposure2", "Qstat", "Qpval")]
write.table(mvmr_sensitivity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/negative_control_mvmr_sensitivity_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
