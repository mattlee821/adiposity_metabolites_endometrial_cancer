rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

library(dplyr)

# data ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/mr_results_formatted.txt", header = T, sep = "\t")
data1 <- subset(data, method == "Wald ratio")
data <- subset(data, method == "Inverse variance weighted (multiplicative random effects)")
data <- rbind(data, data1)
rm(data1)
data$direction[data$OR > 1] <- "+"
data$direction[data$OR < 1] <- "-"
data <- select(data, c("metabolite","outcome",
                       "nsnp","b","se","OR","lower_ci","upper_ci","pval","direction",
                       "UKB_label","UKB_name","UKB_name2","UKB_unit","UKB_class","UKB_subclass","UKB_subclass_unit","UKB_derived"))
data <- subset(data, pval < 0.05)
write.table(data, "adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/associated_metabolites.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
