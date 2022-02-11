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

# obtain list of female instruments ====

## metabolites ====
metabolites <- read.table("adiposity_metabolites_endometrial_cancer/data/metabolites/exposure_data_clumped_female.txt", header = T, sep = "\t")
metabolites$UKB_label <- sub("_int_imputed.txt_snps.txt*", "", metabolites$exposure)
metabolites$UKB_label = gsub("_", "", metabolites$UKB_label)
metabolites$UKB_label = gsub("%", "pct", metabolites$UKB_label)
metabolites$UKB_label = gsub("-", "", metabolites$UKB_label)
metabolites$UKB_label = tolower(metabolites$UKB_label)

## associated metabolites and clump
associated_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/associated_metabolites.txt", header = T, sep = "\t")
associated_metabolites <- associated_metabolites[,1]
metabolites <- metabolites[metabolites$UKB_label %in% associated_metabolites,]

## format for saving
metabolites <- select(metabolites, "SNP", "exposure", "UKB_label")
colnames(metabolites) <- c("SNP","filename","UKB_label")
metabolites$filename <- sub(".txt_snps", "", metabolites$filename)

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

#### combine
bmi_metabolites_list = lapply(associated_metabolites, function(met){
  w = which(metabolites$UKB_label == met)
  return( metabolites[w, ] )
})

for (i in 1:length(bmi_metabolites_list))
  bmi_metabolites_list[[i]] = rbind(bmi_metabolites_list[[i]], adiposity)

for (i in 1:length(bmi_metabolites_list))
  bmi_metabolites_list[[i]] <- clump_data(bmi_metabolites_list[[i]],
                                         clump_kb = 10000,
                                         clump_r2 = 0.001)

names <- unlist(lapply(bmi_metabolites_list,function(x) x[1,2]))
for (i in 1:length(bmi_metabolites_list))
  names(bmi_metabolites_list[[i]]) = names[[i]]

for (i in 1:length(bmi_metabolites_list))
  bmi_metabolites_list[[i]] <- as.data.frame(bmi_metabolites_list[[i]][,1])

#### save
for (i in 1:length(bmi_metabolites_list))
  write.table(bmi_metabolites_list[i], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists/bmi/",names[[i]]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

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

#### combine
whr_metabolites_list = lapply(associated_metabolites, function(met){
  w = which(metabolites$UKB_label == met)
  return( metabolites[w, ] )
})

for (i in 1:length(whr_metabolites_list))
  whr_metabolites_list[[i]] = rbind(whr_metabolites_list[[i]], adiposity)

for (i in 1:length(whr_metabolites_list))
  whr_metabolites_list[[i]] <- clump_data(whr_metabolites_list[[i]],
                                          clump_kb = 10000,
                                          clump_r2 = 0.001)

names <- unlist(lapply(whr_metabolites_list,function(x) x[1,2]))
for (i in 1:length(whr_metabolites_list))
  names(whr_metabolites_list[[i]]) = names[[i]]

for (i in 1:length(whr_metabolites_list))
  whr_metabolites_list[[i]] <- as.data.frame(whr_metabolites_list[[i]][,1])

#### save
for (i in 1:length(whr_metabolites_list))
  write.table(whr_metabolites_list[i], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists/whr/",names[[i]]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

### whradjbmi ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snps_female.txt",
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

for (i in 1:length(whradjbmi_metabolites_list))
  whradjbmi_metabolites_list[[i]] <- clump_data(whradjbmi_metabolites_list[[i]],
                                          clump_kb = 10000,
                                          clump_r2 = 0.001)

names <- unlist(lapply(whradjbmi_metabolites_list,function(x) x[1,2]))
for (i in 1:length(whradjbmi_metabolites_list))
  names(whradjbmi_metabolites_list[[i]]) = names[[i]]

for (i in 1:length(whradjbmi_metabolites_list))
  whradjbmi_metabolites_list[[i]] <- as.data.frame(whradjbmi_metabolites_list[[i]][,1])

#### save
for (i in 1:length(whradjbmi_metabolites_list))
  write.table(whradjbmi_metabolites_list[i], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists/whradjbmi/",names[[i]]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")



# obtain list of combined instruments ====

## metabolites ====
metabolites <- read.table("adiposity_metabolites_endometrial_cancer/data/metabolites/exposure_data_clumped_female.txt", header = T, sep = "\t")
metabolites$UKB_label <- sub("_int.imputed.txt_snps.txt*", "", metabolites$exposure)
metabolites$UKB_label = gsub("_", "", metabolites$UKB_label)
metabolites$UKB_label = gsub("%", "pct", metabolites$UKB_label)
metabolites$UKB_label = gsub("-", "", metabolites$UKB_label)
metabolites$UKB_label = tolower(metabolites$UKB_label)

## associated metabolites and clump
associated_metabolites <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/associated_metabolites.txt", header = T, sep = "\t")
associated_metabolites <- associated_metabolites[,1]
metabolites <- metabolites[metabolites$UKB_label %in% associated_metabolites,]

## format for saving
metabolites <- select(metabolites, "SNP", "exposure", "UKB_label")
colnames(metabolites) <- c("SNP","filename","UKB_label")
metabolites$filename <- sub(".txt_snps", "", metabolites$filename)

## adiposity instruments ====
### bmi ====
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

#### combine
bmi_metabolites_list = lapply(associated_metabolites, function(met){
  w = which(metabolites$UKB_label == met)
  return( metabolites[w, ] )
})

for (i in 1:length(bmi_metabolites_list))
  bmi_metabolites_list[[i]] = rbind(bmi_metabolites_list[[i]], adiposity)

for (i in 1:length(bmi_metabolites_list))
  bmi_metabolites_list[[i]] <- clump_data(bmi_metabolites_list[[i]],
                                          clump_kb = 10000,
                                          clump_r2 = 0.001)

names <- unlist(lapply(bmi_metabolites_list,function(x) x[1,2]))
for (i in 1:length(bmi_metabolites_list))
  names(bmi_metabolites_list[[i]]) = names[[i]]

for (i in 1:length(bmi_metabolites_list))
  bmi_metabolites_list[[i]] <- as.data.frame(bmi_metabolites_list[[i]][,1])

#### save
for (i in 1:length(bmi_metabolites_list))
  write.table(bmi_metabolites_list[i], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists/bmi/",names[[i]]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

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

#### combine
whr_metabolites_list = lapply(associated_metabolites, function(met){
  w = which(metabolites$UKB_label == met)
  return( metabolites[w, ] )
})

for (i in 1:length(whr_metabolites_list))
  whr_metabolites_list[[i]] = rbind(whr_metabolites_list[[i]], adiposity)

for (i in 1:length(whr_metabolites_list))
  whr_metabolites_list[[i]] <- clump_data(whr_metabolites_list[[i]],
                                          clump_kb = 10000,
                                          clump_r2 = 0.001)

names <- unlist(lapply(whr_metabolites_list,function(x) x[1,2]))
for (i in 1:length(whr_metabolites_list))
  names(whr_metabolites_list[[i]]) = names[[i]]

for (i in 1:length(whr_metabolites_list))
  whr_metabolites_list[[i]] <- as.data.frame(whr_metabolites_list[[i]][,1])

#### save
for (i in 1:length(whr_metabolites_list))
  write.table(whr_metabolites_list[i], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists/whr/",names[[i]]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")

### whradjbmi ====
adiposity <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snps_combined.txt",
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

for (i in 1:length(whradjbmi_metabolites_list))
  whradjbmi_metabolites_list[[i]] <- clump_data(whradjbmi_metabolites_list[[i]],
                                                clump_kb = 10000,
                                                clump_r2 = 0.001)

names <- unlist(lapply(whradjbmi_metabolites_list,function(x) x[1,2]))
for (i in 1:length(whradjbmi_metabolites_list))
  names(whradjbmi_metabolites_list[[i]]) = names[[i]]

for (i in 1:length(whradjbmi_metabolites_list))
  whradjbmi_metabolites_list[[i]] <- as.data.frame(whradjbmi_metabolites_list[[i]][,1])

#### save
for (i in 1:length(whradjbmi_metabolites_list))
  write.table(whradjbmi_metabolites_list[i], paste0("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists/whradjbmi/",names[[i]]),
              row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
