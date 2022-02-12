rm(list=ls())
# MR analysis of measures of adiposity and metabolites 

# environment ====
## library ====
library(TwoSampleMR)
library(ieugwasr)
library(data.table)
library(dplyr)

## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

# obtain list of instruments
## BMI and metabolites ====
data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snps_female.txt",
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
data <- as.data.frame(unique(data[,c("SNP")]))
write.table(data, "adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snp_list_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snps_combined.txt",
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
data <- as.data.frame(unique(data[,c("SNP")]))
write.table(data, "adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snp_list_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## WHR and metabolites ====
data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snps_female.txt",
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
data <- as.data.frame(unique(data[,c("SNP")]))
write.table(data, "adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snp_list_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snps_combined.txt",
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
data <- as.data.frame(unique(data[,c("SNP")]))
write.table(data, "adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snp_list_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## whradjbmi and metabolites ====
data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snps_female.txt",
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
data <- as.data.frame(unique(data[,c("SNP")]))
write.table(data, "adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snp_list_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snps_combined.txt",
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
data <- as.data.frame(unique(data[,c("SNP")]))
write.table(data, "adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snp_list_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

