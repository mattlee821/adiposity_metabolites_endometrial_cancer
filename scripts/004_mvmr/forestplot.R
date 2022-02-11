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
library(rlang)
library(cowplot)
library(wesanderson)
colours <- names(wes_palettes)
discrete_palette <- wes_palette(name = "Rushmore1", type = "discrete")
discrete_palette <- wes_palette(name = "Darjeeling1", type = "discrete")
a <- wes_palette(name = "Rushmore1", type = "discrete")
discrete_palette <- c(discrete_palette,a)
source("adiposity_metabolites_endometrial_cancer/scripts/my_forestplot.R")

# MVMR main plot ====
increasing_increasing <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites_increasing_increasing.txt", header = T, sep = "\t")
increasing_increasing <- increasing_increasing[,1]
decreasing_decreasing <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites_decreasing_decreasing.txt", header = T, sep = "\t")
decreasing_decreasing <- decreasing_decreasing[,1]
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_results.txt", header = T, sep = "\t", stringsAsFactors = T)
data <- subset(data, method == "Multivariable MR")
data <- subset(data, exposure == "BMI")
pos_pos <- data[data$adjusted %in% increasing_increasing,]
pos_pos <- droplevels(pos_pos)
neg_neg <- data[data$adjusted %in% decreasing_decreasing,]
neg_neg <- droplevels(neg_neg)

# MR ====
mr <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_results.txt", header = T, sep = "\t", stringsAsFactors = T)
mr <- subset(mr, group == "Adiposity on cancer")

# negative control
negative_control <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_results.txt", header = T, sep = "\t", stringsAsFactors = T)
negative_control <- subset(negative_control, method == "Negative control MVMR" & exposure == "BMI")

# combine ====
pos_pos <- rbind(mr,pos_pos,negative_control)
neg_neg <- rbind(mr,neg_neg,negative_control)

## format factors
increasing_increasing <- sort(increasing_increasing)
decreasing_decreasing <- sort(decreasing_decreasing)

pos_pos$adjusted <- factor(pos_pos$adjusted, levels = c("BMI", "WHR", "WHRadjBMI", increasing_increasing))
pos_pos$exposure <- factor(pos_pos$exposure, levels = c("BMI", "WHR", "WHRadjBMI"))
pos_pos$outcome <- factor(pos_pos$outcome, levels = c("Endometrial cancer", "Endometrioid cancer", "Non-endometrioid cancer"))
pos_pos$method <- factor(pos_pos$method, levels = c("Two Sample MR", "Negative control MVMR", "Multivariable MR"))

neg_neg$adjusted <- factor(neg_neg$adjusted, levels = c("BMI", "WHR", "WHRadjBMI", decreasing_decreasing))
neg_neg$exposure <- factor(neg_neg$exposure, levels = c("BMI", "WHR", "WHRadjBMI"))
neg_neg$outcome <- factor(neg_neg$outcome, levels = c("Endometrial cancer", "Endometrioid cancer", "Non-endometrioid cancer"))
neg_neg$method <- factor(neg_neg$method, levels = c("Two Sample MR", "Negative control MVMR", "Multivariable MR"))

# axis limits ====
max(neg_neg$upper_ci, pos_pos$upper_ci)
min(neg_neg$lower_ci, pos_pos$lower_ci)

# colours ====
colours1 <- c("#F2AD00", "#FF0000", "#5BBCD6",
              "#b76da8",
               "#5fbe50",
               "#c656be",
               "#4b8c39",
               "#7862cf",
               "#a8b547",
               "#7083ca",
               "#d59d3b",
               "#45aecf",
               "#d35238",
               "#5ec396",
               "#cf3d72",
               "#36815b",
               "#c56872",
               "#7b7b35",
               "#b77544")

colours2 <- c("#F2AD00", "#FF0000", "#5BBCD6",
              "#5482d2",
               "#97bc37",
               "#8b5cd5",
               "#45992e",
               "#9e40b6",
               "#52c86b",
               "#dd64d1",
               "#678429",
               "#516add",
               "#d4a433",
               "#b079db",
               "#b5a94d",
               "#a64297",
               "#3a8a51",
               "#de4a9f",
               "#90bb76",
               "#e4427b",
               "#50c5b8",
               "#dc414c",
               "#348d72",
               "#ce502a",
               "#52a5d6",
               "#d97f2e",
               "#6557a0",
               "#617e40",
               "#b23a72",
               "#746c27",
               "#a797db",
               "#9a622b",
               "#da89c3",
               "#e1986c",
               "#99517a",
               "#ae594f",
               "#e47f8e",
               "#ae394a")
  


# plot pos_pos ====
plot_data <- pos_pos
psignif <- 0.05
ci <- 0.95
max(plot_data$upper_ci)
min(plot_data$lower_ci)

# outcome 1
plot_data1 <- subset(plot_data, outcome == "Endometrial cancer")
p1 <- my_forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  scale_colour_manual(values = colours1) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.8, 3.5)) +
  ggtitle("Endometrial cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# outcome 2
plot_data1 <- subset(plot_data, outcome == "Endometrioid cancer")
p2 <- my_forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  scale_colour_manual(values = colours1) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.8, 3.5)) +
  ggtitle("Endometrioid cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# outcome 3
plot_data1 <- subset(plot_data, outcome == "Non-endometrioid cancer")
p3 <- my_forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  scale_colour_manual(values = colours1) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.8, 3.5)) +
  ggtitle("Non-endometrioid cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# y_axis and legend
legend <- my_forestplot(df = plot_data1,
                     name = exposure,
                     estimate = b,
                     pvalue = pval,
                     psignif = psignif,
                     ci = ci,
                     se = se,
                     colour = adjusted,
                     logodds = T) +
  scale_colour_manual(values = colours1) +
  theme(legend.title = element_blank()) +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 
legend <- get_legend(legend)

pdf("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/figures/forestplot_positive_positive.pdf",
    width = 16, height = 9, pointsize = 10)
plot_grid(p1,p2,p3,legend, nrow = 1, rel_widths = c(1.2,1,1,0.4))
dev.off()

# plot neg_neg ====
plot_data <- neg_neg
psignif <- 0.05
ci <- 0.95
max(plot_data$upper_ci)
min(plot_data$lower_ci)

# outcome 1
plot_data1 <- subset(plot_data, outcome == "Endometrial cancer")
p1 <- my_forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  scale_colour_manual(values = colours2) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.8, 3.5)) +
  ggtitle("Endometrial cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# outcome 2
plot_data1 <- subset(plot_data, outcome == "Endometrioid cancer")
p2 <- my_forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  scale_colour_manual(values = colours2) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.8, 3.5)) +
  ggtitle("Endometrioid cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# outcome 3
plot_data1 <- subset(plot_data, outcome == "Non-endometrioid cancer")
p3 <- my_forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  scale_colour_manual(values = colours2) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.8, 3.5)) +
  ggtitle("Non-endometrioid cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# y_axis and legend
legend <- my_forestplot(df = plot_data1,
                     name = exposure,
                     estimate = b,
                     pvalue = pval,
                     psignif = psignif,
                     ci = ci,
                     se = se,
                     colour = adjusted,
                     logodds = T) +
  scale_colour_manual(values = colours2) +
  theme(legend.title = element_blank()) +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 
legend <- get_legend(legend)

pdf("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/figures/forestplot_negative_negative.pdf",
    width = 16, height = 9, pointsize = 10)
plot_grid(p1,p2,p3,legend, nrow = 1, rel_widths = c(1.2,1,1,0.8))
dev.off()



# MVMR secondary plot ====
# MR ====
mr <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_results.txt", header = T, sep = "\t", stringsAsFactors = T)
mr <- subset(mr, group == "Adiposity on cancer")
mr <- subset(mr, exposure == "BMI")

# metabolite results ====
increasing_increasing <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites_increasing_increasing.txt", header = T, sep = "\t")
increasing_increasing <- increasing_increasing[,1]
decreasing_decreasing <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/associated_metabolites_decreasing_decreasing.txt", header = T, sep = "\t")
decreasing_decreasing <- decreasing_decreasing[,1]
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_results.txt", header = T, sep = "\t", stringsAsFactors = T)
data <- subset(data, method == "Multivariable MR")
data <- subset(data, exposure == "BMI")
pos_pos <- data[data$adjusted %in% increasing_increasing,]
pos_pos <- droplevels(pos_pos)
neg_neg <- data[data$adjusted %in% decreasing_decreasing,]
neg_neg <- droplevels(neg_neg)

## format factors
increasing_increasing <- sort(increasing_increasing)
decreasing_decreasing <- sort(decreasing_decreasing)

# combine ====
data <- rbind(mr,pos_pos,neg_neg)
data$adjusted <- factor(data$adjusted, levels = c("BMI", increasing_increasing, decreasing_decreasing))
data$outcome <- factor(data$outcome, levels = c("Endometrial cancer", "Endometrioid cancer", "Non-endometrioid cancer"))
data$method <- factor(data$method, levels = c("Two Sample MR", "Multivariable MR"))
data <- droplevels(data)

# create table for plot ====
## metabolite names
metabolites <- read.table("adiposity_metabolites_endometrial_cancer/data/metabolite_labels.txt", header = T, sep = "\t")
metabolites <- metabolites[,c("UKB_label", "UKB_name2", "UKB_subclass")]
data$UKB_label <- data$adjusted
data <- left_join(data, metabolites, by = "UKB_label")
data$UKB_name2[1:3] <- "BMI"
data$UKB_subclass[1:3] <- "Two-sample MR"
data$UKB_subclass <- factor(data$UKB_subclass, levels = c("Two-sample MR",
                                                          "Amino acids",
                                                          "Cholesterol","Cholesteryl esters","Triglycerides","Phospholipids","Other lipids","Total lipids","Inflammation",
                                                          "Large HDL","Very large HDL",
                                                          "IDL",
                                                          "Small LDL","Medium LDL","Large LDL",
                                                          "Very small VLDL","Small VLDL","Medium VLDL",                                                                                                                "Small HDL ratios","Medium HDL ratios","Large HDL ratios",
                                                          "IDL ratios",
                                                          "Small LDL ratios","Medium LDL ratios","Large LDL ratios",
                                                          "Very small VLDL ratios","Small VLDL ratios","Medium VLDL ratios","Large VLDL ratios"))

# axis limits ====
max(data$upper_ci)
min(data$lower_ci)

# plot pos_pos ====
plot_data <- data
psignif <- 0.05
ci <- 0.95
max(data$upper_ci)
min(data$lower_ci)

# outcome 1
plot_data1 <- subset(plot_data, outcome == "Endometrial cancer")
p1 <- my_forestplot(df = plot_data1,
                    name = UKB_name2,
                    estimate = b,
                    pvalue = pval,
                    psignif = psignif,
                    ci = ci,
                    se = se,
                    colour = "#F2AD00",
                    logodds = T) +
  scale_colour_manual(values = colours1) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(1, 3.1)) +
  ggtitle("Endometrial cancer") +
  ggforce::facet_col(facets = ~UKB_subclass,
                     scales = "free_y",
                     space = "free") 
# outcome 2
plot_data1 <- subset(plot_data, outcome == "Endometrioid cancer")
p2 <- my_forestplot(df = plot_data1,
                    name = UKB_name2,
                    estimate = b,
                    pvalue = pval,
                    psignif = psignif,
                    ci = ci,
                    se = se,
                    colour = "#F2AD00",
                    logodds = T) +
  scale_colour_manual(values = colours1) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(1, 3.1)) +
  ggtitle("Endometrioid cancer") +
  ggforce::facet_col(facets = ~UKB_subclass,
                     scales = "free_y",
                     space = "free") 

# outcome 3
plot_data1 <- subset(plot_data, outcome == "Non-endometrioid cancer")
p3 <- my_forestplot(df = plot_data1,
                    name = UKB_name2,
                    estimate = b,
                    pvalue = pval,
                    psignif = psignif,
                    ci = ci,
                    se = se,
                    colour = "#F2AD00",
                    logodds = T) +
  scale_colour_manual(values = colours1) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(1, 3.1)) +
  ggtitle("Non-endometrioid cancer") +
  ggforce::facet_col(facets = ~UKB_subclass,
                     scales = "free_y",
                     space = "free") 

pdf("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/figures/forestplot_new_style.pdf",
    width = 15, height = 19 , pointsize = 10)
plot_grid(p1,p2,p3, nrow = 1, rel_widths = c(1.9,1,1))
dev.off()



