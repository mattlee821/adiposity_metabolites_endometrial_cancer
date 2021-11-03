rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)
library(dplyr)

# endometrial cancer increasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "+")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites ====
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "+")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
increasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(increasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites_increasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# endometrial cancer decreasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "-")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites ====
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "+")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
decreasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(decreasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites_decreasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# combined
metabolites <- rbind(increasing,decreasing)
write.table(metabolites, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
