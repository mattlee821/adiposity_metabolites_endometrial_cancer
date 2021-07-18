rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

library(dplyr)
library(metaboprep)

# format metabolites
data <- read.table("007_metabolites_outcomes/analysis/002_adiposity_metabolite/bmi/mr_results.txt", header = T, sep = "\t")
data$outcome <- sub("_int_imputed.txt_adiposity_instruments.txt*", "", data$outcome)

data$outcome = gsub("_", "pct", data$outcome)
data$outcome = gsub("%", "pct", data$outcome)
data$outcome = gsub("/", "_", data$outcome)
data$outcome = gsub("\\.", "", data$outcome)
data$outcome = gsub("-", "", data$outcome)
data$outcome = gsub("_", "", data$outcome)
data$outcome = tolower(data$outcome)
ng_anno <- (metaboprep:::ng_anno)
ng_anno <- ng_anno[,c(1:5,7)]








results_whr <- read.table("007_metabolites_outcomes/analysis/002_adiposity_metabolite/whr/mr_results.txt", header = T, sep = "\t")
results_bf <- read.table("007_metabolites_outcomes/analysis/002_adiposity_metabolite/bf/mr_results.txt", header = T, sep = "\t")
