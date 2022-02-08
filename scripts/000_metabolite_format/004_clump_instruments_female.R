rm(list=ls())
# MR analysis of measures of adiposity and metabolites 

# environment ====
## library ====
#remotes::install_github("MRCIEU/TwoSampleMR")
#remotes::install_github("mrcieu/ieugwasr")
library(TwoSampleMR)

## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

## extract exposure instruments ====
exposure_data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/metabolites/exposure_data_female.txt",
                                    clump = F,
                                    sep = " ",
                                    snp_col = "SNP",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "A1FREQ",
                                    effect_allele_col = "ALLELE1",
                                    other_allele_col = "ALLELE0",
                                    pval_col = "P_BOLT_LMM_INF",
                                    phenotype = "phenotype",
                                    min_pval = 5e-8)

exposure_data <- clump_data(exposure_data,
                                  clump_kb = 10000,
                                  clump_r2 = 0.001)

write.table(exposure_data, "adiposity_metabolites_endometrial_cancer/data/metabolites/exposure_data_clumped_female.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
