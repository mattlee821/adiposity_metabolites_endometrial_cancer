rm(list=ls())
# MR analysis of measures of adiposity and metabolites 

# environment ====
## library ====
#remotes::install_github("MRCIEU/TwoSampleMR")
#remotes::install_github("mrcieu/ieugwasr")
library(TwoSampleMR)
library(ieugwasr)
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
bmi <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/bmi_snps.txt",
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
bmi$exposure <- "BMI"
bmi$id.exposure <- "BMI"
bmi$f_stats <- (bmi$b / bmi$se)^2 
bmi$mean_fstat <- mean(bmi$f_stats)

whr <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/whr_snps.txt",
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
whr$exposure <- "WHR"
whr$id.exposure <- "WHR"
whr$f_stats <- (whr$b / whr$se)^2 
whr$mean_fstat <- mean(whr$f_stats)

whradjbmi <- read_exposure_data("adiposity_metabolites_endometrial_cancer/data/whradjbmi_snps.txt",
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

whradjbmi$exposure <- "WHRadjBMI"
whradjbmi$id.exposure <- "WHRadjBMI"
whradjbmi$f_stats <- (whradjbmi$b / whradjbmi$se)^2 
whradjbmi$mean_fstat <- mean(whradjbmi$f_stats)

## extract outcome data ====
outcome_data_bmi <- read_outcome_data(
    snps = bmi$SNP,
    filename = "adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/metabolite_outcome_bmi.txt",
    sep = " ",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    effect_allele_col = "ALLELE1",
    other_allele_col = "ALLELE0",
    eaf_col = "A1FREQ",
    pval_col = "P_BOLT_LMM_INF",
    phenotype = "phenotype")

outcome_data_whr <- read_outcome_data(
    snps = whr$SNP,
    filename = "adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/metabolite_outcome_whr.txt",
    sep = " ",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    effect_allele_col = "ALLELE1",
    other_allele_col = "ALLELE0",
    eaf_col = "A1FREQ",
    pval_col = "P_BOLT_LMM_INF",
    phenotype = "phenotype")

outcome_data_whradjbmi <- read_outcome_data(
    snps = whradjbmi$SNP,
    filename = "adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/metabolite_outcome_whradjbmi.txt",
    sep = " ",
    snp_col = "SNP",
    beta_col = "BETA",
    se_col = "SE",
    effect_allele_col = "ALLELE1",
    other_allele_col = "ALLELE0",
    eaf_col = "A1FREQ",
    pval_col = "P_BOLT_LMM_INF",
    phenotype = "phenotype")

# BMI ====
## harmonize data ====
harmonise_data <- harmonise_data(bmi, outcome_data_bmi, action = 2)

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
pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/figures/mr_scatter.pdf")
for (i in 1:length(plot_mr_scatter)) {
  print(plot_mr_scatter[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/figures/singlesnp_forest.pdf")
for (i in 1:length(plot_singlesnp_forest)) {
  print(plot_singlesnp_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/figures/leaveoneout_forest.pdf")
for (i in 1:length(plot_leaveoneout_forest)) {
  print(plot_leaveoneout_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/figures/mr_funnel.pdf")
for (i in 1:length(plot_mr_funnel)) {
  print(plot_mr_funnel[[i]])
}
dev.off()

## Save output ====
write.table(bmi, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/exposure_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(harmonise_data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/harmonise_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_results, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_results.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_singlesnp, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_singlesnp.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_hetrogeneity, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_hetrogeneity.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_pleiotropy, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_pleiotropy.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_leaveoneout, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/bmi/mr_leaveoneout.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")



# WHR ====
## harmonize data ====
harmonise_data <- harmonise_data(whr, outcome_data_whr, action = 2)

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
pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/figures/mr_scatter.pdf")
for (i in 1:length(plot_mr_scatter)) {
  print(plot_mr_scatter[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/figures/singlesnp_forest.pdf")
for (i in 1:length(plot_singlesnp_forest)) {
  print(plot_singlesnp_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/figures/leaveoneout_forest.pdf")
for (i in 1:length(plot_leaveoneout_forest)) {
  print(plot_leaveoneout_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/figures/mr_funnel.pdf")
for (i in 1:length(plot_mr_funnel)) {
  print(plot_mr_funnel[[i]])
}
dev.off()

## Save output ====
write.table(whr, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/exposure_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(harmonise_data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/harmonise_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_results, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_results.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_singlesnp, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_singlesnp.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_hetrogeneity, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_hetrogeneity.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_pleiotropy, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_pleiotropy.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_leaveoneout, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whr/mr_leaveoneout.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")


# whradjbmi ====
## harmonize data ====
harmonise_data <- harmonise_data(whradjbmi, outcome_data_whradjbmi, action = 2)

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
pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/figures/mr_scatter.pdf")
for (i in 1:length(plot_mr_scatter)) {
  print(plot_mr_scatter[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/figures/singlesnp_forest.pdf")
for (i in 1:length(plot_singlesnp_forest)) {
  print(plot_singlesnp_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/figures/leaveoneout_forest.pdf")
for (i in 1:length(plot_leaveoneout_forest)) {
  print(plot_leaveoneout_forest[[i]])
}
dev.off()

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/figures/mr_funnel.pdf")
for (i in 1:length(plot_mr_funnel)) {
  print(plot_mr_funnel[[i]])
}
dev.off()

## Save output ====
write.table(whradjbmi, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/exposure_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(harmonise_data, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/harmonise_data.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_results, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_results.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_singlesnp, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_singlesnp.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_hetrogeneity, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_hetrogeneity.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_pleiotropy, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_pleiotropy.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
write.table(mr_leaveoneout, "adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/whradjbmi/mr_leaveoneout.txt", 
            row.names = FALSE, col.names = TRUE, quote = FALSE, sep = "\t")
