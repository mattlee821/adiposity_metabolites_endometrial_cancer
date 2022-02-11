rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)
library(dplyr)

# female ====
# increasing increasing ====
# endometrial cancer increasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "+")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites 
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "+")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
increasing_increasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(increasing_increasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/associated_metabolites_increasing_increasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# increasing decreasing ====
# endometrial cancer decreasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "-")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "+")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
increasing_decreasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(increasing_decreasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/associated_metabolites_increasing_decreasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# decreasing decreasing ====
# endometrial cancer decreasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "+")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "-")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
decreasing_increasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(decreasing_increasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/associated_metabolites_decreasing_increasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# increasing decreasing ====
# endometrial cancer decreasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "-")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "-")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
decreasing_decreasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(decreasing_decreasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/associated_metabolites_decreasing_decreasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# merge ====
metabolites <- rbind(increasing_increasing,decreasing_decreasing)
write.table(metabolites, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/associated_metabolites.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


# increasing increasing ====
# endometrial cancer increasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "+")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites 
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "+")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
increasing_increasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(increasing_increasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/associated_metabolites_increasing_increasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# increasing decreasing ====
# endometrial cancer decreasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "-")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "+")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
increasing_decreasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(increasing_decreasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/associated_metabolites_increasing_decreasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# decreasing decreasing ====
# endometrial cancer decreasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "+")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "-")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
decreasing_increasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(decreasing_increasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/associated_metabolites_decreasing_increasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# increasing decreasing ====
# endometrial cancer decreasing associated metabolites
metabolites_endo <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/associated_metabolites.txt", header = T, sep = "\t")
metabolites_endo <- subset(metabolites_endo, direction == "-")
metabolites_endo_list <- metabolites_endo$metabolite

# adiposity associated metabolites
adiposity_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/combined/001_mr_results.txt", header = T, sep = "\t")
adiposity_metabolites <- subset(adiposity_metabolites, pval < 0.05)
adiposity_metabolites <- subset(adiposity_metabolites, direction == "-")
adiposity_metabolites <- adiposity_metabolites[adiposity_metabolites$metabolite %in% metabolites_endo_list,]

# associated metabolites
decreasing_decreasing <- data.frame(unique(adiposity_metabolites$UKB_label))
write.table(decreasing_decreasing, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/associated_metabolites_decreasing_decreasing.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# merge ====
metabolites <- rbind(increasing_increasing,decreasing_decreasing)
write.table(metabolites, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/associated_metabolites.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
