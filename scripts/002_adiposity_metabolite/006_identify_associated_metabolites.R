rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

library(dplyr)

# extract associated metabolites ====
## bmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_results_formatted.txt", header = T, sep = "\t")
data <- subset(data, method == "Inverse variance weighted (multiplicative random effects)")
data$bmi_direction[data$b > 0] <- "+"
data$bmi_direction[data$b < 0] <- "-"
data <- select(data, c("exposure","metabolite",
                       "nsnp","b","se","pval","bmi_direction",
                       "UKB_label","UKB_name","UKB_name2","UKB_unit","UKB_class","UKB_subclass","UKB_subclass_unit","UKB_derived"))
bmi <- data
bmi_direction <- data[,c("metabolite","bmi_direction")]

## whr ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_results_formatted.txt", header = T, sep = "\t")
data <- subset(data, method == "Inverse variance weighted (multiplicative random effects)")
data$whr_direction[data$b > 0] <- "+"
data$whr_direction[data$b < 0] <- "-"
data <- select(data, c("exposure","metabolite",
                       "nsnp","b","se","pval","whr_direction",
                       "UKB_label","UKB_name","UKB_name2","UKB_unit","UKB_class","UKB_subclass","UKB_subclass_unit","UKB_derived"))
whr <- data
whr_direction <- data[,c("metabolite","whr_direction")]


## whradjbmi ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_results_formatted.txt", header = T, sep = "\t")
data <- subset(data, method == "Inverse variance weighted (multiplicative random effects)")
data$whradjbmi_direction[data$b > 0] <- "+"
data$whradjbmi_direction[data$b < 0] <- "-"
data <- select(data, c("exposure","metabolite",
                       "nsnp","b","se","pval","whradjbmi_direction",
                       "UKB_label","UKB_name","UKB_name2","UKB_unit","UKB_class","UKB_subclass","UKB_subclass_unit","UKB_derived"))
whradjbmi <- data
whradjbmi_direction <- data[,c("metabolite","whradjbmi_direction")]

# directions ====
direction <- full_join(bmi_direction, whr_direction, by = "metabolite")
direction <- full_join(direction, whradjbmi_direction, by = "metabolite")
direction$overall_direction <- paste0(direction$bmi_direction,direction$whr_direction, direction$whradjbmi_direction)
direction_pos <- subset(direction, overall_direction == "+++")
direction_neg <- subset(direction, overall_direction == "---")
direction_inconsistent <- subset(direction, overall_direction != "+++")
direction_inconsistent <- subset(direction_inconsistent, overall_direction != "---")
write.table(direction_pos, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/directions_of_effect_pos.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(direction_neg, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/directions_of_effect_neg.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(direction_inconsistent, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/directions_of_effect_inconsistent.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# master ====
colnames(bmi)[7] <- "direction"
colnames(whr)[7] <- "direction"
colnames(whradjbmi)[7] <- "direction"
data <- rbind(bmi,whr,whradjbmi)
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/001_mr_results.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
data <- subset(data, pval < 0.05/249)
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/001_mr_results_bonferroni.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
