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

# data ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/combined/2smr_mvmr_formatted_results.txt", header = T, sep = "\t", stringsAsFactors = T)

## format factors
my_files <- list.files(path = "adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/results/adiposity/whradjbmi/", pattern = "*txt")
my_files <- gsub("_int_imputed.txt", "", my_files)
my_files = gsub("_", "", my_files)
my_files = gsub("%", "pct", my_files)
my_files = gsub("-", "", my_files)
my_files = tolower(my_files)
my_files <- sort(my_files)
data$adjusted <- factor(data$adjusted, levels = c("BMI", "WHR", "WHRadjBMI", my_files))
data$exposure <- factor(data$exposure, levels = c("BMI", "WHR", "WHRadjBMI", my_files))
data$outcome <- factor(data$outcome, levels = c("Endometrial cancer", "Endometrioid cancer", "Non-endometrioid cancer"))
data$method <- factor(data$method, levels = c("Two Sample MR", "Multivariable MR"))

# plot ====
plot_data <- data
psignif <- 0.05
ci <- 0.95

# outcome 1
plot_data1 <- subset(plot_data, outcome == "Endometrial cancer")
p1 <- forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.3, 4)) +
  ggtitle("Endometrial") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# outcome 2
plot_data1 <- subset(plot_data, outcome == "Endometrioid cancer")
p2 <- forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.3, 4)) +
  ggtitle("Endometrioid cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# outcome 3
plot_data1 <- subset(plot_data, outcome == "Non-endometrioid cancer")
p3 <- forestplot(df = plot_data1,
                 name = exposure,
                 estimate = b,
                 pvalue = pval,
                 psignif = psignif,
                 ci = ci,
                 se = se,
                 colour = adjusted,
                 logodds = T) +
  theme(axis.title.x = element_blank()) +
  theme(axis.text.y = element_blank()) +
  theme(legend.position = "none") +
  coord_cartesian(xlim = c(0.3, 4)) +
  ggtitle("Non-endometrioid cancer") +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 

# y_axis and legend
legend <- forestplot(df = plot_data1,
                     name = exposure,
                     estimate = b,
                     pvalue = pval,
                     psignif = psignif,
                     ci = ci,
                     se = se,
                     colour = adjusted,
                     logodds = T) +
  theme(legend.title = element_blank()) +
  ggforce::facet_col(facets = ~method,
                     scales = "free_y",
                     space = "free") 
legend <- get_legend(legend)

pdf("adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/figures/forestplot.pdf",
    width = 14, height = 8, pointsize = 10)
plot_grid(p1,p2,p3,legend, nrow = 1, rel_widths = c(1.2,1,1,0.4))
dev.off()

