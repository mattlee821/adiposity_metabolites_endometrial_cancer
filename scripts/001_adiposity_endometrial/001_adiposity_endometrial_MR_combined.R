rm(list=ls())
# MR analysis of measures of adiposity and endometrial cancer 

# environment ====
## library ====
#remotes::install_github("MRCIEU/TwoSampleMR")
library(TwoSampleMR)
library(data.table)
library(RadialMR)
library(dplyr)

## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

### methods
methods <- mr_method_list()
methods_heterogeneity <- subset(methods, heterogeneity_test == TRUE)$obj
methods_heterogeneity <- methods_heterogeneity[c(1,2,3,5)]
methods <- methods[c(3,6,10,13),1]

### colours
#install.packages("wesanderson")
library(wesanderson)
d1 <- wes_palette("Royal1", type = "discrete")
d2 <- wes_palette("GrandBudapest2", type = "discrete")
d3 <- wes_palette("Cavalcanti1", type = "discrete")
d4 <- wes_palette("Rushmore1", type = "discrete")
discrete_wes_pal <- c(d1, d2, d3, d4)
rm(d1,d2,d3,d4)

## extract exposure instruments ====
a <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/bmi_snps_combined.txt",
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
a$exposure <- "BMI"
a$id.exposure <- "BMI"
a$f_stats <- (a$b / a$se)^2 
a$mean_fstat <- mean(a$f_stats)

a1 <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/whr_snps_combined.txt",
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
a1$exposure <- "WHR"
a1$id.exposure <- "WHR"
a1$f_stats <- (a1$b / a1$se)^2 
a1$mean_fstat <- mean(a1$f_stats)

a2 <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/whradjbmi_snps_combined.txt",
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
a2$exposure <- "WHRadjBMI"
a2$id.exposure <- "WHRadjBMI"
a2$f_stats <- (a2$b / a2$se)^2 
a2$mean_fstat <- mean(a2$f_stats)

exposure_data <- bind_rows(a,a1,a2)

## extract outcome data ====
outcome_data <- extract_outcome_data(exposure_data$SNP, c('ebi-a-GCST006464', 'ebi-a-GCST006465', 'ebi-a-GCST006466'), proxies = 1, rsq = 0.8, align_alleles = 1, palindromes = 1, maf_threshold = 0.3)

## harmonize data ====
harmonise_data <- harmonise_data(exposure_data, outcome_data, action = 2)

## MR ====
mr_results <- mr(harmonise_data, method_list = methods)

## Sensitivity analysis ====
mr_singlesnp <- mr_singlesnp(harmonise_data)
mr_hetrogeneity <- mr_heterogeneity(harmonise_data,
                                    method_list = methods_heterogeneity)
mr_pleiotropy <- mr_pleiotropy_test(harmonise_data)
mr_leaveoneout <- mr_leaveoneout(harmonise_data)

## Plots ====
plot_mr_scatter <- mr_scatter_plot(mr_results, harmonise_data)
plot_singlesnp_forest <- mr_forest_plot(mr_singlesnp)
plot_leaveoneout_forest <- mr_leaveoneout_plot(mr_leaveoneout)
plot_mr_funnel <- mr_funnel_plot(mr_singlesnp)

### save plots ====
pdf("adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/figures/plot_mr_scatter.pdf")
for (i in 1:length(plot_mr_scatter)) {
  print(plot_mr_scatter[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/figures/plot_singlesnp_forest.pdf")
for (i in 1:length(plot_singlesnp_forest)) {
  print(plot_singlesnp_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/figures/plot_leaveoneout_forest.pdf")
for (i in 1:length(plot_leaveoneout_forest)) {
  print(plot_leaveoneout_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/figures/plot_mr_funnel.pdf")
for (i in 1:length(plot_mr_funnel)) {
  print(plot_mr_funnel[[i]])
}
dev.off()

## Save output ====
write.table(exposure_data, "adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/exposure_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(harmonise_data, "adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/harmonise_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_results, "adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/mr_results.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_singlesnp, "adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/mr_singlesnp.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_hetrogeneity, "adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/mr_hetrogeneity.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_pleiotropy, "adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/mr_pleiotropy.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_leaveoneout, "adiposity_metabolites_endometrial_cancer/analysis/001_adiposity_endometrial/combined/mr_leaveoneout.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


