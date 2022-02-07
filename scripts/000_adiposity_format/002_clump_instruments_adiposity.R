# clump adiposity instruments
rm(list=ls())

# environment ====
## library ====
#remotes::install_github("MRCIEU/TwoSampleMR")
library(TwoSampleMR)

cd /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity


# format SNP column ====
data <- read.table("bmi.giant-ukbb.meta-analysis.females.23May2018.txt_snps.txt", header = T, sep = " ")
data$rsID <- gsub(":.*", "", data$SNP)
write.table(data, "bmi_snps_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read.table("bmi.giant-ukbb.meta-analysis.combined.23May2018.txt_snps.txt", header = T, sep = " ")
data$rsID <- gsub(":.*", "", data$SNP)
write.table(data, "bmi_snps_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read.table("whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt_snps.txt", header = T, sep = " ")
data$rsID <- gsub(":.*", "", data$SNP)
write.table(data, "whradjbmi_snps_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read.table("whradjbmi.giant-ukbb.meta-analysis.combined.23May2018.txt_snps.txt", header = T, sep = " ")
data$rsID <- gsub(":.*", "", data$SNP)
write.table(data, "whradjbmi_snps_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read.table("whr.giant-ukbb.meta-analysis.females.23May2018.txt_snps.txt", header = T, sep = " ")
data$rsID <- gsub(":.*", "", data$SNP)
write.table(data, "whr_snps_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read.table("whr.giant-ukbb.meta-analysis.combined.23May2018.txt_snps.txt", header = T, sep = " ")
data$rsID <- gsub(":.*", "", data$SNP)
write.table(data, "whr_snps_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

# clump SNPs ====
## BMI
data <- read_exposure_data("bmi_snps_female.txt",
                                    clump = F,
                                    sep = "\t",
                                    snp_col = "rsID",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "Freq_Tested_Allele",
                                    effect_allele_col = "Tested_Allele",
                                    other_allele_col = "Other_Allele",
                                    pval_col = "P",
                                    samplesize_col = "N",
                                    min_pval = 5e-9)
data$exposure <- "BMI"
data <- clump_data(data, clump_kb = 10000, clump_r2 = 0.001)
write.table(data, "bmi_snps_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read_exposure_data("bmi_snps_combined.txt",
                                    clump = F,
                                    sep = "\t",
                                    snp_col = "rsID",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "Freq_Tested_Allele",
                                    effect_allele_col = "Tested_Allele",
                                    other_allele_col = "Other_Allele",
                                    pval_col = "P",
                                    samplesize_col = "N",
                                    min_pval = 5e-9)
data$exposure <- "BMI"
data <- clump_data(data, clump_kb = 10000, clump_r2 = 0.001)
write.table(data, "bmi_snps_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## WHR
data <- read_exposure_data("whr_snps_female.txt",
                                    clump = F,
                                    sep = "\t",
                                    snp_col = "rsID",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "Freq_Tested_Allele",
                                    effect_allele_col = "Tested_Allele",
                                    other_allele_col = "Other_Allele",
                                    pval_col = "P",
                                    samplesize_col = "N",
                                    min_pval = 5e-9)
data$exposure <- "WHR"
data <- clump_data(data, clump_kb = 10000, clump_r2 = 0.001)
write.table(data, "whr_snps_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read_exposure_data("whr_snps_combined.txt",
                                    clump = F,
                                    sep = "\t",
                                    snp_col = "rsID",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "Freq_Tested_Allele",
                                    effect_allele_col = "Tested_Allele",
                                    other_allele_col = "Other_Allele",
                                    pval_col = "P",
                                    samplesize_col = "N",
                                    min_pval = 5e-9)
data$exposure <- "WHR"
data <- clump_data(data, clump_kb = 10000, clump_r2 = 0.001)
write.table(data, "whr_snps_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

## WHRadjBMI
data <- read_exposure_data("whradjbmi_snps_female.txt",
                                    clump = F,
                                    sep = "\t",
                                    snp_col = "rsID",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "Freq_Tested_Allele",
                                    effect_allele_col = "Tested_Allele",
                                    other_allele_col = "Other_Allele",
                                    pval_col = "P",
                                    samplesize_col = "N",
                                    min_pval = 5e-9)
data$exposure <- "WHRadjBMI"
data <- clump_data(data, clump_kb = 10000, clump_r2 = 0.001)
write.table(data, "whradjbmi_snps_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

data <- read_exposure_data("whradjbmi_snps_combined.txt",
                                    clump = F,
                                    sep = "\t",
                                    snp_col = "rsID",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "Freq_Tested_Allele",
                                    effect_allele_col = "Tested_Allele",
                                    other_allele_col = "Other_Allele",
                                    pval_col = "P",
                                    samplesize_col = "N",
                                    min_pval = 5e-9)
data$exposure <- "WHRadjBMI"
data <- clump_data(data, clump_kb = 10000, clump_r2 = 0.001)
write.table(data, "whradjbmi_snps_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


