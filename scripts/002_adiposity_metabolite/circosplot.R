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
colours <- names(wes_palettes)
discrete_palette <- wes_palette(colours[8], type = "discrete")
source("adiposity_metabolites_endometrial_cancer/scripts/circos_plot.R")

# data ====
plot_data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/001_mr_results.txt", header = T, sep = "\t")
plot_data$exposure <- factor(plot_data$exposure, levels = c("BMI", "WHR", "WHRadjBMI"))
plot_data <- droplevels(plot_data)
plot_data$UKB_subclass <- factor(plot_data$UKB_subclass, levels = c(
  "Amino acids", "Aromatic amino acids", "Branched-chain amino acids",
  "Apolipoproteins","Cholesterol", "Free cholesterol", "Cholesteryl esters", "Fatty acids", "Fatty acid ratios",
  
  "Very large HDL",                      
  "Very large HDL ratios", 
  "Large HDL",                        
  "Large HDL ratios",
  "Medium HDL",                            
  "Medium HDL ratios",                                   
  "Small HDL",                             
  "Small HDL ratios", 
  
  "Large LDL", 
  "Large LDL ratios",                                   
  "Medium LDL",                            
  "Medium LDL ratios",                                  
  "Small LDL",                             
  "Small LDL ratios",                                   
  
  "IDL",                                   
  "IDL ratios", 
  
  "Very large VLDL",                       
  "Very large VLDL ratios", 
  "Large VLDL",                            
  "Large VLDL ratios",          
  "Medium VLDL", 
  "Medium VLDL ratios",                                 
  "Small VLDL",                            
  "Small VLDL ratios",                                 
  "Very small VLDL",                       
  "Very small VLDL ratios",
  
  "Chylomicrons and extremely large VLDL",
  "Chylomicrons and extremely large VLDL ratios",
  
  "Lipoprotein particle concentrations", "Lipoprotein particle sizes", "Total lipids", "Other lipids", "Phospholipids", "Triglycerides", "Fluid balance", "Glycolysis related metabolites", "Inflammation", "Ketone bodies")
)

# plot ====
plot_data$lower_ci <- plot_data$b - (1.96 * plot_data$se)
plot_data$upper_ci <- plot_data$b + (1.96 * plot_data$se)
plot_data1 <- subset(plot_data, exposure == "BMI")
plot_data2 <- subset(plot_data, exposure == "WHR")
plot_data3 <- subset(plot_data, exposure == "WHRadjBMI")

# circos plot ====
pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/circosplot.pdf",
    width = 45, height = 45, pointsize = 30)
circos_plot(track_number = 3,
            track1_data = plot_data1,
            track2_data = plot_data2,
            track3_data = plot_data3,
            track1_type = "points",
            track2_type = "points",
            track3_type = "points",
            label_column = 10,
            section_column = 13,
            estimate_column = 4,
            pvalue_column = 6,
            pvalue_adjustment = 0.05/0.05,
            lower_ci = 16,
            upper_ci = 17,
            legend = T, 
            track1_label = "BMI", track2_label = "WHR", track3_label = "WHRadjBMI", pvalue_label = "P > 0.05",
            track1_height = 0.2,track2_height = 0.2,track3_height = 0.2,
            circle_size = 25)

dev.off()
