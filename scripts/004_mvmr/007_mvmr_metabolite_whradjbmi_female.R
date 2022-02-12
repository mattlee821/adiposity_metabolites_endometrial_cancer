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

# metabolite instruments ====
my_files <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/metabolite_instruments/whradjbmi/", pattern = "*txt")
metabolites <- list()
for (i in seq_along(my_files)) {
  metabolites[[i]] <- read.table(paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/metabolite_instruments/whradjbmi/",file = my_files[i]), header = T, sep = "\t")
}
names(metabolites) <- gsub("\\.txt$", "", my_files)

for (i in 1:length(metabolites))
  colnames(metabolites[[i]]) <- c("SNP","CHR","POS","GENPOS","effect_allele.exposure","other_allele.exposure","eaf.exposure",
                                  "INFO","CHISQ_LINREG","P_LINREG","beta.exposure","se.exposure","CHISQ_BOLT_LMM_INF","pval.exposure")
for (i in 1:length(metabolites))
  metabolites[[i]]$exposure <- my_files[[i]]
for (i in 1:length(metabolites))
  metabolites[[i]]$id.exposure <- my_files[[i]]
for (i in 1:length(metabolites))
  metabolites[[i]]$samplesize.exposure <- 118466
for (i in 1:length(metabolites))
  metabolites[[i]] <- select(metabolites[[i]], c("CHR","POS","SNP","effect_allele.exposure","other_allele.exposure","eaf.exposure","beta.exposure","se.exposure","pval.exposure","samplesize.exposure","exposure","id.exposure"))

# adiposity instruments ====
my_files <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/whradjbmi/", pattern = "*txt")
adiposity <- list()
for (i in seq_along(my_files)) {
  adiposity[[i]] <- read.table(paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/whradjbmi/",file = my_files[i]), header = T, sep = " ")
}
names(adiposity) <- gsub("\\.txt$", "", my_files)

for (i in 1:length(adiposity))
  colnames(adiposity[[i]]) <- c("CHR","POS","SNP","effect_allele.outcome","other_allele.outcome","eaf.outcome","beta.outcome","se.outcome","pval.outcome","samplesize.outcome","INFO")
for (i in 1:length(adiposity))
  adiposity[[i]]$outcome <- "WHRadjBMI"
for (i in 1:length(adiposity))
  adiposity[[i]]$id.outcome <- "WHRadjBMI"
for (i in 1:length(adiposity))
  adiposity[[i]]$SNP <- gsub(":.*", "", adiposity[[i]]$SNP)
for (i in 1:length(adiposity))
  adiposity[[i]] <- select(adiposity[[i]], c("CHR","POS","SNP","effect_allele.outcome","other_allele.outcome","eaf.outcome","beta.outcome","se.outcome","pval.outcome","samplesize.outcome","outcome","id.outcome"))


# harmonise metabolite instruments and adiposity instruments ====
harmonize_data <- list()
for (i in 1:length(metabolites))
  harmonize_data[[i]] <- harmonise_data(exposure_dat = metabolites[[i]], outcome_dat = adiposity[[i]])

for (i in 1:length(harmonize_data))
  harmonize_data[[i]] <- harmonize_data[[i]][,c(
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

for (i in 1:length(harmonize_data))
  colnames(harmonize_data[[i]]) <- c(
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
outcome <- list()
for (i in 1:length(harmonize_data))
  outcome[[i]] <- extract_outcome_data(harmonize_data[[i]]$SNP, c('ebi-a-GCST006464'), proxies = 1, rsq = 0.8, align_alleles = 1, palindromes = 1, maf_threshold = 0.3)

# harmonise metabolite and adiposity instruments with outcome data ====
harmonise_outcome <- list()
for (i in 1:length(harmonize_data))
  harmonise_outcome[[i]] <- harmonise_data(exposure_dat = harmonize_data[[i]], outcome_dat = outcome[[i]])

## format harmonised data
for (i in 1:length(harmonise_outcome))
  harmonise_outcome[[i]] <- harmonise_outcome[[i]][,c(
    "SNP",
    "beta.exposure","beta.outcome1", "beta.outcome",
    "se.exposure","se.outcome1","se.outcome","outcome")]

for (i in 1:length(harmonise_outcome))
  colnames(harmonise_outcome[[i]]) <- c(
    "SNP",
    "metabolite_b", "adiposity_b", "outcome_b",
    "metabolite_se","adiposity_se", "outcome_se",
    "outcome")

# format data for MVMR ====
mvmr_data <- list()
for (i in 1:length(harmonise_outcome))
  mvmr_data[[i]] <- format_mvmr(
    BXGs = harmonise_outcome[[i]][,c(2,3)],
    BYG = harmonise_outcome[[i]]$outcome_b,
    seBXGs = harmonise_outcome[[i]][,c(5,6)],
    seBYG = harmonise_outcome[[i]]$outcome_se, 
    RSID = harmonise_outcome[[i]]$SNP)

# run MVMR ====
result <- list()
for (i in 1:length(mvmr_data))
  result[[i]] <- as.data.frame(ivw_mvmr(r_input = mvmr_data[[i]]))

## run sensitivity
fstat <- list()
for (i in 1:length(mvmr_data))
  fstat[[i]] <- strength_mvmr(r_input = mvmr_data[[i]], gencov = 0)

qstat <- list()
for (i in 1:length(mvmr_data))
  qstat[[i]] <- pleiotropy_mvmr(r_input = mvmr_data[[i]], gencov = 0)

# make results table ====
table <- list()
for (i in 1:length(result))
  table[[i]] <- data.frame(
    b = c(result[[i]][1,1], result[[i]][2,1]),
    se = c(result[[i]][1,2], result[[i]][2,2]),
    t = c(result[[i]][1,3], result[[i]][2,3]),
    p = c(result[[i]][1,4], result[[i]][2,4]),
    exposure = c(my_files[[i]],"whradjbmi"),
    group = c(paste0("whradjbmi_",my_files[[i]])),
    outcome = c("endometrial_cancer","endometrial_cancer"),
    fstat = c(fstat[[i]]),
    qstat = c(qstat[[i]][1]),
    qstat_p = c(qstat[[i]][2]))
names(table) <- gsub("\\_int_imputed.txt$", "", my_files)



# outcome2 ====
outcome <- list()
for (i in 1:length(harmonize_data))
  outcome[[i]] <- extract_outcome_data(harmonize_data[[i]]$SNP, c('ebi-a-GCST006465'), proxies = 1, rsq = 0.8, align_alleles = 1, palindromes = 1, maf_threshold = 0.3)

# harmonise adiposity and metabolite instruments with outcome data ====
harmonise_outcome <- list()
for (i in 1:length(harmonize_data))
  harmonise_outcome[[i]] <- harmonise_data(exposure_dat = harmonize_data[[i]], outcome_dat = outcome[[i]])

## format harmonised data
for (i in 1:length(harmonise_outcome))
  harmonise_outcome[[i]] <- harmonise_outcome[[i]][,c(
    "SNP",
    "beta.exposure","beta.outcome1", "beta.outcome",
    "se.exposure","se.outcome1","se.outcome","outcome")]

for (i in 1:length(harmonise_outcome))
  colnames(harmonise_outcome[[i]]) <- c(
    "SNP",
    "metabolite_b", "adiposity_b", "outcome_b",
    "metabolite_se","adiposity_se", "outcome_se",
    "outcome")

# format data for MVMR ====
mvmr_data <- list()
for (i in 1:length(harmonise_outcome))
  mvmr_data[[i]] <- format_mvmr(
    BXGs = harmonise_outcome[[i]][,c(2,3)],
    BYG = harmonise_outcome[[i]]$outcome_b,
    seBXGs = harmonise_outcome[[i]][,c(5,6)],
    seBYG = harmonise_outcome[[i]]$outcome_se, 
    RSID = harmonise_outcome[[i]]$SNP)

# run MVMR ====
result <- list()
for (i in 1:length(mvmr_data))
  result[[i]] <- as.data.frame(ivw_mvmr(r_input = mvmr_data[[i]]))

## run sensitivity
fstat <- list()
for (i in 1:length(mvmr_data))
  fstat[[i]] <- strength_mvmr(r_input = mvmr_data[[i]], gencov = 0)

qstat <- list()
for (i in 1:length(mvmr_data))
  qstat[[i]] <- pleiotropy_mvmr(r_input = mvmr_data[[i]], gencov = 0)

# make results table ====
table2 <- list()
for (i in 1:length(result))
  table2[[i]] <- data.frame(
    b = c(result[[i]][1,1], result[[i]][2,1]),
    se = c(result[[i]][1,2], result[[i]][2,2]),
    t = c(result[[i]][1,3], result[[i]][2,3]),
    p = c(result[[i]][1,4], result[[i]][2,4]),
    exposure = c(my_files[[i]],"whradjbmi"),
    group = c(paste0("whradjbmi_",my_files[[i]])),
    outcome = c("endometrioid_cancer","endometrioid_cancer"),
    fstat = c(fstat[[i]]),
    qstat = c(qstat[[i]][1]),
    qstat_p = c(qstat[[i]][2]))
names(table2) <- gsub("\\_int_imputed.txt$", "", my_files)





# outcome3 ====
outcome <- list()
for (i in 1:length(harmonize_data))
  outcome[[i]] <- extract_outcome_data(harmonize_data[[i]]$SNP, c('ebi-a-GCST006466'), proxies = 1, rsq = 0.8, align_alleles = 1, palindromes = 1, maf_threshold = 0.3)

# harmonise adiposity and metabolite instruments with outcome data ====
harmonise_outcome <- list()
for (i in 1:length(harmonize_data))
  harmonise_outcome[[i]] <- harmonise_data(exposure_dat = harmonize_data[[i]], outcome_dat = outcome[[i]])

## format harmonised data
for (i in 1:length(harmonise_outcome))
  harmonise_outcome[[i]] <- harmonise_outcome[[i]][,c(
    "SNP",
    "beta.exposure","beta.outcome1", "beta.outcome",
    "se.exposure","se.outcome1","se.outcome","outcome")]

for (i in 1:length(harmonise_outcome))
  colnames(harmonise_outcome[[i]]) <- c(
    "SNP",
    "metabolite_b", "adiposity_b", "outcome_b",
    "metabolite_se","adiposity_se", "outcome_se",
    "outcome")

# format data for MVMR ====
mvmr_data <- list()
for (i in 1:length(harmonise_outcome))
  mvmr_data[[i]] <- format_mvmr(
    BXGs = harmonise_outcome[[i]][,c(2,3)],
    BYG = harmonise_outcome[[i]]$outcome_b,
    seBXGs = harmonise_outcome[[i]][,c(5,6)],
    seBYG = harmonise_outcome[[i]]$outcome_se, 
    RSID = harmonise_outcome[[i]]$SNP)

# run MVMR ====
result <- list()
for (i in 1:length(mvmr_data))
  result[[i]] <- as.data.frame(ivw_mvmr(r_input = mvmr_data[[i]]))

## run sensitivity
fstat <- list()
for (i in 1:length(mvmr_data))
  fstat[[i]] <- strength_mvmr(r_input = mvmr_data[[i]], gencov = 0)

qstat <- list()
for (i in 1:length(mvmr_data))
  qstat[[i]] <- pleiotropy_mvmr(r_input = mvmr_data[[i]], gencov = 0)

# make results table ====
table3 <- list()
for (i in 1:length(result))
  table3[[i]] <- data.frame(
    b = c(result[[i]][1,1], result[[i]][2,1]),
    se = c(result[[i]][1,2], result[[i]][2,2]),
    t = c(result[[i]][1,3], result[[i]][2,3]),
    p = c(result[[i]][1,4], result[[i]][2,4]),
    exposure = c(my_files[[i]],"whradjbmi"),
    group = c(paste0("whradjbmi_",my_files[[i]])),
    outcome = c("non_endometrioid_cancer","non_endometrioid_cancer"),
    fstat = c(fstat[[i]]),
    qstat = c(qstat[[i]][1]),
    qstat_p = c(qstat[[i]][2]))
names(table3) <- gsub("\\_int_imputed.txt$", "", my_files)




# save ====
meta_table <- list()
for (i in 1:length(table))
  meta_table[[i]] <- rbind(table[[i]], table2[[i]], table3[[i]])

for (i in 1:length(meta_table))
  write.table(meta_table[[i]], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/results/metabolites/whradjbmi/",my_files[[i]]), 
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

