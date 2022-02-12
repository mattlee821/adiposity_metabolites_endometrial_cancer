rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

# mvmr BMI ====
my_files <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/adiposity/bmi/", pattern = "*txt")
data <- list()
for (i in seq_along(my_files)) {
  data[[i]] <- read.table(paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/adiposity/bmi/",file = my_files[i]), header = T, sep = "\t")
}
my_files <- gsub("_int_imputed.txt", "", my_files)
my_files = gsub("_", "", my_files)
my_files = gsub("%", "pct", my_files)
my_files = gsub("-", "", my_files)
my_files = tolower(my_files)
names(data) <- my_files

for (i in 1:length(data))
  data[[i]]$exposure[data[[i]]$exposure == "bmi"] <- "BMI"
for (i in 1:length(data))
  data[[i]]$exposure[data[[i]]$exposure != "BMI"] <- my_files[[i]] 

for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "endometrial_cancer"] <- "Endometrial cancer"
for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "endometroid"] <- "Endometroid"
for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "non_endometroid"] <- "Non-endometroid"

for (i in 1:length(data))
  data[[i]]$group <- paste0("BMI_", my_files[[i]])

for (i in 1:length(data))
  data[[i]]$adjusted[data[[i]]$exposure == "BMI" & data[[i]]$group == paste0("BMI_",my_files[[i]])] <- my_files[[i]] 
for (i in 1:length(data))
  data[[i]]$adjusted[data[[i]]$exposure == my_files[[i]]] <- "BMI"

for (i in 1:length(data))
  data[[i]]$method <- "Multivariable MR"

## results ====
mvmr_result <- list()
for (i in 1:length(data))
  mvmr_result[[i]] <- data[[i]][,c("exposure", "outcome", "group", "adjusted", "method", "b", "se", "p")]
for (i in 1:length(mvmr_result))
  colnames(mvmr_result[[i]])[8] <- "pval"
mvmr_result <- bind_rows(mvmr_result, .id = "column_label")
mvmr_result <- subset(mvmr_result, select = -column_label)
write.table(mvmr_result, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/bmi_mvmr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## sensitivity ====
mvmr_sensitivity <- list()
for (i in 1:length(data))
  mvmr_sensitivity[[i]] <- data[[i]][,c("exposure", "outcome", "group", "adjusted", "method", "fstat.exposure1", "fstat.exposure2", "Qstat", "Qpval")]
mvmr_sensitivity <- bind_rows(mvmr_sensitivity, .id = "column_label")
mvmr_sensitivity <- subset(mvmr_sensitivity, select = -column_label)
write.table(mvmr_sensitivity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/bmi_mvmr_sensitivity_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


# mvmr WHR ====
my_files <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/adiposity/whr/", pattern = "*txt")
data <- list()
for (i in seq_along(my_files)) {
  data[[i]] <- read.table(paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/adiposity/whr/",file = my_files[i]), header = T, sep = "\t")
}
my_files <- gsub("_int_imputed.txt", "", my_files)
my_files = gsub("_", "", my_files)
my_files = gsub("%", "pct", my_files)
my_files = gsub("-", "", my_files)
my_files = tolower(my_files)
names(data) <- my_files

for (i in 1:length(data))
  data[[i]]$exposure[data[[i]]$exposure == "whr"] <- "WHR"
for (i in 1:length(data))
  data[[i]]$exposure[data[[i]]$exposure != "WHR"] <- my_files[[i]] 

for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "endometrial_cancer"] <- "Endometrial cancer"
for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "endometroid"] <- "Endometroid"
for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "non_endometroid"] <- "Non-endometroid"

for (i in 1:length(data))
  data[[i]]$group <- paste0("WHR_", my_files[[i]])

for (i in 1:length(data))
  data[[i]]$adjusted[data[[i]]$exposure == "WHR" & data[[i]]$group == paste0("WHR_",my_files[[i]])] <- my_files[[i]] 
for (i in 1:length(data))
  data[[i]]$adjusted[data[[i]]$exposure == my_files[[i]]] <- "WHR"

for (i in 1:length(data))
  data[[i]]$method <- "Multivariable MR"

## results ====
mvmr_result <- list()
for (i in 1:length(data))
  mvmr_result[[i]] <- data[[i]][,c("exposure", "outcome", "group", "adjusted", "method", "b", "se", "p")]
for (i in 1:length(mvmr_result))
  colnames(mvmr_result[[i]])[8] <- "pval"
mvmr_result <- bind_rows(mvmr_result, .id = "column_label")
mvmr_result <- subset(mvmr_result, select = -column_label)
write.table(mvmr_result, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/whr_mvmr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## sensitivity ====
mvmr_sensitivity <- list()
for (i in 1:length(data))
  mvmr_sensitivity[[i]] <- data[[i]][,c("exposure", "outcome", "group", "adjusted", "method", "fstat.exposure1", "fstat.exposure2", "Qstat", "Qpval")]
mvmr_sensitivity <- bind_rows(mvmr_sensitivity, .id = "column_label")
mvmr_sensitivity <- subset(mvmr_sensitivity, select = -column_label)
write.table(mvmr_sensitivity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/whr_mvmr_sensitivity_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


# mvmr WHRadjBMI ====
my_files <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/adiposity/whradjbmi/", pattern = "*txt")
data <- list()
for (i in seq_along(my_files)) {
  data[[i]] <- read.table(paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/adiposity/whradjbmi/",file = my_files[i]), header = T, sep = "\t")
}
my_files <- gsub("_int_imputed.txt", "", my_files)
my_files = gsub("_", "", my_files)
my_files = gsub("%", "pct", my_files)
my_files = gsub("-", "", my_files)
my_files = tolower(my_files)
names(data) <- my_files

for (i in 1:length(data))
  data[[i]]$exposure[data[[i]]$exposure == "whradjbmi"] <- "WHRadjBMI"
for (i in 1:length(data))
  data[[i]]$exposure[data[[i]]$exposure != "WHRadjBMI"] <- my_files[[i]] 

for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "endometrial_cancer"] <- "Endometrial cancer"
for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "endometroid"] <- "Endometroid"
for (i in 1:length(data))
  data[[i]]$outcome[data[[i]]$outcome == "non_endometroid"] <- "Non-endometroid"

for (i in 1:length(data))
  data[[i]]$group <- paste0("WHRadjBMI_", my_files[[i]])

for (i in 1:length(data))
  data[[i]]$adjusted[data[[i]]$exposure == "WHRadjBMI" & data[[i]]$group == paste0("WHRadjBMI_",my_files[[i]])] <- my_files[[i]] 
for (i in 1:length(data))
  data[[i]]$adjusted[data[[i]]$exposure == my_files[[i]]] <- "WHRadjBMI"

for (i in 1:length(data))
  data[[i]]$method <- "Multivariable MR"

## results ====
mvmr_result <- list()
for (i in 1:length(data))
  mvmr_result[[i]] <- data[[i]][,c("exposure", "outcome", "group", "adjusted", "method", "b", "se", "p")]
for (i in 1:length(mvmr_result))
  colnames(mvmr_result[[i]])[8] <- "pval"
mvmr_result <- bind_rows(mvmr_result, .id = "column_label")
mvmr_result <- subset(mvmr_result, select = -column_label)
write.table(mvmr_result, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/whradjbmi_mvmr_results_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## sensitivity ====
mvmr_sensitivity <- list()
for (i in 1:length(data))
  mvmr_sensitivity[[i]] <- data[[i]][,c("exposure", "outcome", "group", "adjusted", "method", "fstat.exposure1", "fstat.exposure2", "Qstat", "Qpval")]
mvmr_sensitivity <- bind_rows(mvmr_sensitivity, .id = "column_label")
mvmr_sensitivity <- subset(mvmr_sensitivity, select = -column_label)
write.table(mvmr_sensitivity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/whradjbmi_mvmr_sensitivity_formatted.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# combined ====
## master results ====
my_files <- c("bmi_mvmr_results_formatted.txt","whr_mvmr_results_formatted.txt","whradjbmi_mvmr_results_formatted.txt")
data <- list()
for (i in seq_along(my_files)) {
  data[[i]] <- read.table(paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/combined/",file = my_files[i]), header = T, sep = "\t")
}
data <- bind_rows(data, .id = "column_label")
data <- subset(data, select = -column_label)

write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/combined/combined_results.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## sensitivity ====
my_files <- c("bmi_mvmr_sensitivity_formatted.txt","whr_mvmr_sensitivity_formatted.txt","whradjbmi_mvmr_sensitivity_formatted.txt")
data <- list()
for (i in seq_along(my_files)) {
  data[[i]] <- read.table(paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/combined/",file = my_files[i]), header = T, sep = "\t")
}
data = data[-3] # remove negative control dataframe
data <- bind_rows(data, .id = "column_label")
data <- subset(data, select = -column_label)

write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/combined/combined_sensitivity.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
