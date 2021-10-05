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

# obtain metabolite instruments ====
## metabolites ====
metabolites <- read_exposure_data("UKB_NMR_GWAS/exposure_data_female.txt",
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
metabolites <- clump_data(metabolites,
                            clump_kb = 10000,
                            clump_r2 = 0.001)
metabolites <- select(metabolites, "SNP", "exposure")
metabolites$UKB_label <- sub("_int_imputed.txt_snps.txt*", "", metabolites$exposure)
metabolites$UKB_label = gsub("_", "", metabolites$UKB_label)
metabolites$UKB_label = gsub("%", "pct", metabolites$UKB_label)
metabolites$UKB_label = gsub("-", "", metabolites$UKB_label)
metabolites$UKB_label = tolower(metabolites$UKB_label)
colnames(metabolites) <- c("SNP","filename","UKB_label")
metabolites$filename <- sub(".txt_snps", "", metabolites$filename)

## associated metabolites
associated_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites.txt", header = T, sep = "\t")
associated_metabolites <- associated_metabolites[,1]
metabolites <- metabolites[metabolites$UKB_label %in% associated_metabolites,]

## adiposity instruments ====
### bmi ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/bmi_snps.txt",
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

#### combine
bmi_metabolites_list = lapply(associated_metabolites, function(met){
  w = which(metabolites$UKB_label == met)
  return( metabolites[w, ] )
})
for (i in 1:length(bmi_metabolites_list))
  bmi_metabolites_list[[i]] = rbind(bmi_metabolites_list[[i]], adiposity)

### whr ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/whr_snps.txt",
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

#### combine
whr_metabolites_list = lapply(associated_metabolites, function(met){
  w = which(metabolites$UKB_label == met)
  return( metabolites[w, ] )
})
for (i in 1:length(whr_metabolites_list))
  whr_metabolites_list[[i]] = rbind(whr_metabolites_list[[i]], adiposity)

### whradjbmi ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/whradjbmi_snps.txt",
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

#### combine
whradjbmi_metabolites_list = lapply(associated_metabolites, function(met){
  w = which(metabolites$UKB_label == met)
  return( metabolites[w, ] )
})
for (i in 1:length(whradjbmi_metabolites_list))
  whradjbmi_metabolites_list[[i]] = rbind(whradjbmi_metabolites_list[[i]], adiposity)


## save ====
for (i in 1:length(bmi_metabolites_list))
  write.table(bmi_metabolites_list[[i]], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/bmi/",whradjbmi_metabolites_list[[i]][1,2]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

for (i in 1:length(whr_metabolites_list))
  write.table(whr_metabolites_list[[i]], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/whr/",whradjbmi_metabolites_list[[i]][1,2]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

for (i in 1:length(whradjbmi_metabolites_list))
  write.table(whradjbmi_metabolites_list[[i]], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/whradjbmi/",whradjbmi_metabolites_list[[i]][1,2]),
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
