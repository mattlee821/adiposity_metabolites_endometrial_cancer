rm(list=ls())
# MR analysis of measures of adiposity and metabolites 
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

# environment ====
## library ====
library(TwoSampleMR)
library(MVMR)
library(data.table)
library(dplyr)

# bmi instruments ====
exposure_data <- read_exposure_data("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments/BMI_adj_WHR_combined.txt",
                                    clump = F,
                                    sep = " ",
                                    snp_col = "SNP",
                                    beta_col = "BETA",
                                    se_col = "SE",
                                    eaf_col = "Freq_Tested_Allele",
                                    effect_allele_col = "Tested_Allele",
                                    other_allele_col = "Other_Allele",
                                    pval_col = "P",
                                    samplesize_col = "N",
                                    min_pval = 5e-9)
exposure_data$exposure <- "BMI"
exposure_data$id.exposure <- "BMI"
exposure_data$SNP <- gsub(":.*", "", exposure_data$SNP)

exposure_data <- clump_data(exposure_data,
                            clump_kb = 10000,
                            clump_r2 = 0.001)



# whr instruments ====
outcome_data <- read_outcome_data("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments/WHR_adj_BMI_combined.txt",
                                  sep = " ",
                                  snp_col = "SNP",
                                  beta_col = "BETA",
                                  se_col = "SE",
                                  eaf_col = "Freq_Tested_Allele",
                                  effect_allele_col = "Tested_Allele",
                                  other_allele_col = "Other_Allele",
                                  pval_col = "P",
                                  samplesize_col = "N",
                                  min_pval = 5e-9)
outcome_data$outcome <- "WHR"
outcome_data$id.outcome <- "WHR"
outcome_data$SNP <- gsub(":.*", "", outcome_data$SNP)

# harmonise adiposity instruments and metabolite instruments ====
harmonize_data <- harmonise_data(exposure_dat = exposure_data, outcome_dat = outcome_data)
harmonize_data <- harmonize_data[,c(
  "SNP", 
  "effect_allele.exposure", "other_allele.exposure",
  "effect_allele.outcome", "other_allele.outcome",
  "beta.exposure","beta.outcome", 
  "eaf.exposure", "eaf.outcome",
  "se.exposure","se.outcome",
  "pval.exposure","pval.outcome",
  "samplesize.exposure","samplesize.outcome",
  "exposure","id.exposure",
  "id.outcome","outcome")]

colnames(harmonize_data) <- c(
  "SNP", 
  "effect_allele.exposure", "other_allele.exposure",
  "effect_allele.outcome1", "other_allele.outcome1",
  "beta.exposure","beta.outcome1", 
  "eaf.exposure", "eaf.outcome1",
  "se.exposure","se.outcome1",
  "pval.exposure","pval.outcome1",
  "samplesize.exposure","samplesize.outcome1",
  "exposure","id.exposure",
  "id.outcome1","outcome1")

# outcome1 ====
outcome <- extract_outcome_data(harmonize_data$SNP, c('ebi-a-GCST006464'), proxies = 1, rsq = 0.8, align_alleles = 1, palindromes = 1, maf_threshold = 0.3)

# harmonise adiposity and metabolite instruments with outcome data ====
harmonise_outcome <- harmonise_data(exposure_dat = harmonize_data, outcome_dat = outcome)

## format harmonised data
harmonise_outcome <- harmonise_outcome[,c(
  "SNP",
  "beta.exposure","beta.outcome1", "beta.outcome",
  "se.exposure","se.outcome1","se.outcome","outcome")]

colnames(harmonise_outcome) <- c(
  "SNP",
  "adiposity_b", "metabolite_b", "outcome_b",
  "adiposity_se","metabolite_se", "outcome_se",
  "outcome")

# format data for MVMR ====
mvmr_data <- format_mvmr(
  BXGs = harmonise_outcome[,c(2,3)],
  BYG = harmonise_outcome$outcome_b,
  seBXGs = harmonise_outcome[,c(5,6)],
  seBYG = harmonise_outcome$outcome_se, 
  RSID = harmonise_outcome$SNP)

# run MVMR ====
result <- as.data.frame(ivw_mvmr(r_input = mvmr_data))

## run sensitivity
fstat <- strength_mvmr(r_input = mvmr_data, gencov = 0)

qstat <- pleiotropy_mvmr(r_input = mvmr_data, gencov = 0)

# make results table ====
table <- data.frame(
  b = c(result[1,1], result[2,1]),
  se = c(result[1,2], result[2,2]),
  t = c(result[1,3], result[2,3]),
  p = c(result[1,4], result[2,4]),
  exposure = c("bmi", "bmi_whr"),
  group = "bmi_whr",
  outcome = c("endometrial_cancer","endometrial_cancer"),
  fstat = c(fstat),
  qstat = c(qstat[1]),
  qstat_p = c(qstat[2]))

# outcome2 ====
outcome <- extract_outcome_data(harmonize_data$SNP, c('ebi-a-GCST006465'), proxies = 1, rsq = 0.8, align_alleles = 1, palindromes = 1, maf_threshold = 0.3)

# harmonise adiposity and metabolite instruments with outcome data ====
harmonise_outcome <- harmonise_data(exposure_dat = harmonize_data, outcome_dat = outcome)

## format harmonised data
harmonise_outcome <- harmonise_outcome[,c(
  "SNP",
  "beta.exposure","beta.outcome1", "beta.outcome",
  "se.exposure","se.outcome1","se.outcome","outcome")]

colnames(harmonise_outcome) <- c(
  "SNP",
  "adiposity_b", "metabolite_b", "outcome_b",
  "adiposity_se","metabolite_se", "outcome_se",
  "outcome")

# format data for MVMR ====
mvmr_data <- format_mvmr(
  BXGs = harmonise_outcome[,c(2,3)],
  BYG = harmonise_outcome$outcome_b,
  seBXGs = harmonise_outcome[,c(5,6)],
  seBYG = harmonise_outcome$outcome_se, 
  RSID = harmonise_outcome$SNP)

# run MVMR ====
result <- as.data.frame(ivw_mvmr(r_input = mvmr_data))

## run sensitivity
fstat <- strength_mvmr(r_input = mvmr_data, gencov = 0)

qstat <- pleiotropy_mvmr(r_input = mvmr_data, gencov = 0)

# make results table ====
table2 <- data.frame(
  b = c(result[1,1], result[2,1]),
  se = c(result[1,2], result[2,2]),
  t = c(result[1,3], result[2,3]),
  p = c(result[1,4], result[2,4]),
  exposure = c("bmi", "bmi_whr"),
  group = "bmi_whr",
  outcome = c("endometrioid_cancer","endometrioid_cancer"),
  fstat = c(fstat),
  qstat = c(qstat[1]),
  qstat_p = c(qstat[2]))

# outcome3 ====
outcome <- extract_outcome_data(harmonize_data$SNP, c('ebi-a-GCST006466'), proxies = 1, rsq = 0.8, align_alleles = 1, palindromes = 1, maf_threshold = 0.3)

# harmonise adiposity and metabolite instruments with outcome data ====
harmonise_outcome <- harmonise_data(exposure_dat = harmonize_data, outcome_dat = outcome)

## format harmonised data
harmonise_outcome <- harmonise_outcome[,c(
  "SNP",
  "beta.exposure","beta.outcome1", "beta.outcome",
  "se.exposure","se.outcome1","se.outcome","outcome")]

colnames(harmonise_outcome) <- c(
  "SNP",
  "adiposity_b", "metabolite_b", "outcome_b",
  "adiposity_se","metabolite_se", "outcome_se",
  "outcome")

# format data for MVMR ====
mvmr_data <- format_mvmr(
  BXGs = harmonise_outcome[,c(2,3)],
  BYG = harmonise_outcome$outcome_b,
  seBXGs = harmonise_outcome[,c(5,6)],
  seBYG = harmonise_outcome$outcome_se, 
  RSID = harmonise_outcome$SNP)

# run MVMR ====
result <- as.data.frame(ivw_mvmr(r_input = mvmr_data))

## run sensitivity
fstat <- strength_mvmr(r_input = mvmr_data, gencov = 0)

qstat <- pleiotropy_mvmr(r_input = mvmr_data, gencov = 0)

# make results table ====
table3 <- data.frame(
  b = c(result[1,1], result[2,1]),
  se = c(result[1,2], result[2,2]),
  t = c(result[1,3], result[2,3]),
  p = c(result[1,4], result[2,4]),
  exposure = c("bmi", "bmi_whr"),
  group = "bmi_whr",
  outcome = c("non_endometrioid_cancer","non_endometrioid_cancer"),
  fstat = c(fstat),
  qstat = c(qstat[1]),
  qstat_p = c(qstat[2]))

# save ====
meta_table <- rbind(table, table2, table3)

write.table(meta_table, "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/results/combined/negative_control_combined.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

