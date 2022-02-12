rm(list=ls())
# MR analysis of measures of adiposity and metabolites 

# environment ====
## library ====
library(TwoSampleMR)
library(data.table)
library(dplyr)

## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

# obtain list of instruments
## adiposity instruments ====
### bmi ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snps_female.txt",
                                clump = F,
                                sep = "\t",
                                snp_col = "SNP",
                                beta_col = "beta.exposure",
                                se_col = "se.exposure",
                                eaf_col = "eaf.exposure",
                                effect_allele_col = "effect_allele.exposure",
                                other_allele_col = "other_allele.exposure",
                                pval_col = "pval.exposure",
                                samplesize_col = "samplesize.exposure",
                                phenotype = "exposure",
                                min_pval = 5e-9)
adiposity <- select(adiposity, c("SNP", "exposure"))
adiposity$filename <- NA
colnames(adiposity)[2] <- "UKB_label"
bmi <- adiposity 

### whr ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snps_female.txt",
                                clump = F,
                                sep = "\t",
                                snp_col = "SNP",
                                beta_col = "beta.exposure",
                                se_col = "se.exposure",
                                eaf_col = "eaf.exposure",
                                effect_allele_col = "effect_allele.exposure",
                                other_allele_col = "other_allele.exposure",
                                pval_col = "pval.exposure",
                                samplesize_col = "samplesize.exposure",
                                phenotype = "exposure",
                                min_pval = 5e-9)
adiposity <- select(adiposity, c("SNP", "exposure"))
adiposity$filename <- NA
colnames(adiposity)[2] <- "UKB_label"
adiposity <- rbind(bmi,adiposity)

#save ====
adiposity <- as.data.frame(adiposity[,1])
write.table(adiposity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists/bmi_whr_female.txt",
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# combined ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snps_combined.txt",
                                clump = F,
                                sep = "\t",
                                snp_col = "SNP",
                                beta_col = "beta.exposure",
                                se_col = "se.exposure",
                                eaf_col = "eaf.exposure",
                                effect_allele_col = "effect_allele.exposure",
                                other_allele_col = "other_allele.exposure",
                                pval_col = "pval.exposure",
                                samplesize_col = "samplesize.exposure",
                                phenotype = "exposure",
                                min_pval = 5e-9)
adiposity <- select(adiposity, c("SNP", "exposure"))
adiposity$filename <- NA
colnames(adiposity)[2] <- "UKB_label"
bmi <- adiposity 

### whr ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snps_combined.txt",
                                clump = F,
                                sep = "\t",
                                snp_col = "SNP",
                                beta_col = "beta.exposure",
                                se_col = "se.exposure",
                                eaf_col = "eaf.exposure",
                                effect_allele_col = "effect_allele.exposure",
                                other_allele_col = "other_allele.exposure",
                                pval_col = "pval.exposure",
                                samplesize_col = "samplesize.exposure",
                                phenotype = "exposure",
                                min_pval = 5e-9)
adiposity <- select(adiposity, c("SNP", "exposure"))
adiposity$filename <- NA
colnames(adiposity)[2] <- "UKB_label"
adiposity <- rbind(bmi,adiposity)

#save ====
adiposity <- as.data.frame(adiposity[,1])
write.table(adiposity, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists/bmi_whr_combined.txt",
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
