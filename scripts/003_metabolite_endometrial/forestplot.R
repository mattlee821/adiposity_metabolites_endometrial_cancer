rm(list=ls())
## set environment ====
directory_1 <- Sys.getenv("directory_1")
setwd(directory_1)

# source ====
library(ggplot2)
library(dplyr)
library(knitr)
library(patchwork)
library(tidyr)
library(purrr)
library(ggforestplot)
library(wesanderson)
source("adiposity_metabolites_endometrial_cancer/scripts/my_forestplot.R")
colours <- names(wes_palettes)
discrete_palette <- wes_palette(colours[8], type = "discrete")

# main plot female ====
plot_data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/mr_results_formatted.txt", header = T, sep = "\t")
plot_data$outcome_label[plot_data$outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465"] <- "Endometrioid"
plot_data$outcome_label[plot_data$outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466"] <- "Non-endometroid"
plot_data$outcome_label[plot_data$outcome == "Endometrial cancer || id:ebi-a-GCST006464"] <- "Endometrial cancer"
plot_data$outcome_label <- factor(plot_data$outcome_label, levels = c("Endometrial cancer", "Endometrioid", "Non-endometroid"))

plot_data$method[plot_data$method == "Inverse variance weighted (multiplicative random effects)"] <- "IVW-MRE"
plot_data <- subset(plot_data, method != "Maximum likelihood")
plot_data <- droplevels(plot_data)

psignif <- 0.05
ci <- 0.95

plot_data <- plot_data[order(plot_data$UKB_name2),]

pdf("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/figures/forestplot.pdf",
    width = 12, height = 50, pointsize = 10)
forestplot(df = plot_data,
           name = UKB_name2,
           estimate = b,
           pvalue = pval,
           psignif = psignif,
           ci = ci,
           se = se,
           colour = outcome_label,
           shape = method,
           logodds = T) +
  scale_color_manual(values = c(discrete_palette[3], discrete_palette[1], discrete_palette[5])) +
  theme(axis.title.x = element_blank()) +
  theme(legend.title = element_blank())
dev.off()


# plot female: BMI associated metabolites that are associated with EC at 0.05 ====

# bmi associated metabolites
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/female/combined/001_mr_results.txt", header = T, sep = "\t")
data <- subset(data, exposure == "BMI")
data <- subset(data, pval < 0.05/249)
metabolites <- unique(data$metabolite)
bmi_direction <- data[,c("metabolite", "direction")]
colnames(bmi_direction)[2] <- "bmi_direction"

# metabolites associated endo
data2 <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/associated_metabolites.txt", header = T, sep = "\t")
metabolites2 <- unique(data2$metabolite)

# shared metabolites
associated_metabolites <- Reduce(intersect, list(metabolites,metabolites2))

# data for plot
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/associated_metabolites.txt", header = T, sep = "\t")
data <- data[data$metabolite %in% associated_metabolites,]
data <- left_join(data, bmi_direction, by = "metabolite")
data$outcome[data$outcome == "Endometrial cancer || id:ebi-a-GCST006464"] <- "Endometrial cancer"
data$outcome[data$outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465"] <- "Endometrioid cancer"
data$outcome[data$outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466"] <- "Non-endometrioid cancer"
plot_data <- data[,c("metabolite", "outcome", "b", "OR", "se", "pval", "UKB_name2", "UKB_subclass", "bmi_direction")]

# plot
ci <- 0.95
psignif <- 0.05

pdf("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/figures/forestplot_bmi_associated_and_endo_associated.pdf",
    width = 9, height = 16, pointsize = 10)
my_forestplot(df = plot_data,
                    name = UKB_name2,
                    estimate = b,
                    pvalue = pval,
                    psignif = psignif,
                    ci = ci,
                    se = se,
                    colour = outcome,
                    shape = bmi_direction,
                    logodds = T) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "right") +
  ggforce::facet_col(facets = ~UKB_subclass,
                     scales = "free_y",
                     space = "free") 
dev.off()




# main plot combined ====
plot_data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/mr_results_formatted.txt", header = T, sep = "\t")
plot_data$outcome_label[plot_data$outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465"] <- "Endometrioid"
plot_data$outcome_label[plot_data$outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466"] <- "Non-endometroid"
plot_data$outcome_label[plot_data$outcome == "Endometrial cancer || id:ebi-a-GCST006464"] <- "Endometrial cancer"
plot_data$outcome_label <- factor(plot_data$outcome_label, levels = c("Endometrial cancer", "Endometrioid", "Non-endometroid"))

plot_data$method[plot_data$method == "Inverse variance weighted (multiplicative random effects)"] <- "IVW-MRE"
plot_data <- subset(plot_data, method != "Maximum likelihood")
plot_data <- droplevels(plot_data)

psignif <- 0.05
ci <- 0.95

plot_data <- plot_data[order(plot_data$UKB_name2),]

pdf("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/figures/forestplot.pdf",
    width = 12, height = 50, pointsize = 10)
forestplot(df = plot_data,
           name = UKB_name2,
           estimate = b,
           pvalue = pval,
           psignif = psignif,
           ci = ci,
           se = se,
           colour = outcome_label,
           shape = method,
           logodds = T) +
  scale_color_manual(values = c(discrete_palette[3], discrete_palette[1], discrete_palette[5])) +
  theme(axis.title.x = element_blank()) +
  theme(legend.title = element_blank())
dev.off()


# plot combined: BMI associated metabolites that are associated with EC at 0.05 ====
# bmi associated metabolites
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/combined/001_mr_results.txt", header = T, sep = "\t")
data <- subset(data, exposure == "BMI")
data <- subset(data, pval < 0.05/249)
metabolites <- unique(data$metabolite)
bmi_direction <- data[,c("metabolite", "direction")]
colnames(bmi_direction)[2] <- "bmi_direction"

# metabolites associated endo
data2 <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/associated_metabolites.txt", header = T, sep = "\t")
metabolites2 <- unique(data2$metabolite)

# shared metabolites
associated_metabolites <- Reduce(intersect, list(metabolites,metabolites2))

# data for plot
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/associated_metabolites.txt", header = T, sep = "\t")
data <- data[data$metabolite %in% associated_metabolites,]
data <- left_join(data, bmi_direction, by = "metabolite")
data$outcome[data$outcome == "Endometrial cancer || id:ebi-a-GCST006464"] <- "Endometrial cancer"
data$outcome[data$outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465"] <- "Endometrioid cancer"
data$outcome[data$outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466"] <- "Non-endometrioid cancer"
plot_data <- data[,c("metabolite", "outcome", "b", "OR", "se", "pval", "UKB_name2", "UKB_subclass", "bmi_direction")]

# plot
ci <- 0.95
psignif <- 0.05

pdf("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/figures/forestplot_bmi_associated_and_endo_associated.pdf",
    width = 9, height = 16, pointsize = 10)
my_forestplot(df = plot_data,
              name = UKB_name2,
              estimate = b,
              pvalue = pval,
              psignif = psignif,
              ci = ci,
              se = se,
              colour = outcome,
              shape = bmi_direction,
              logodds = T) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "right") +
  ggforce::facet_col(facets = ~UKB_subclass,
                     scales = "free_y",
                     space = "free") 
dev.off()

