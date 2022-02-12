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

# female ====
plot_data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/mr_results_formatted.txt", header = T, sep = "\t")
plot_data1 <- subset(plot_data, method == "Wald ratio")
plot_data <- subset(plot_data, method == "Inverse variance weighted (multiplicative random effects)")
plot_data <- rbind(plot_data, plot_data1)
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
plot_data1 <- subset(plot_data, outcome == "Endometrial cancer || id:ebi-a-GCST006464")
plot_data1 <- droplevels(plot_data1)
plot_data2 <- subset(plot_data, outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465")
plot_data2 <- droplevels(plot_data2)
plot_data3 <- subset(plot_data, outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466")
plot_data3 <- droplevels(plot_data3)

# circos plot ====
pdf("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/female/figures/circosplot.pdf",
    width = 45, height = 45, pointsize = 30)
circos_plot(track_number = 3,
            track1_data = plot_data1,
            track2_data = plot_data2,
            track3_data = plot_data3,
            track1_type = "points",
            track2_type = "points",
            track3_type = "points",
            label_column = 15,
            section_column = 18,
            estimate_column = 30,
            pvalue_column = 9,
            pvalue_adjustment = 0.05,
            lower_ci = 31,
            upper_ci = 32,
            legend = T, 
            track1_label = "Endometrial cancer", track2_label = "Endometrioid cancer", track3_label = "Non-endometrioid cancer", pvalue_label = "P > 0.05",
            track1_height = 0.2,track2_height = 0.2,track3_height = 0.2,
            circle_size = 25)
dev.off()


# combined ====
plot_data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/mr_results_formatted.txt", header = T, sep = "\t")
plot_data1 <- subset(plot_data, method == "Wald ratio")
plot_data <- subset(plot_data, method == "Inverse variance weighted (multiplicative random effects)")
plot_data <- rbind(plot_data, plot_data1)
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
plot_data1 <- subset(plot_data, outcome == "Endometrial cancer || id:ebi-a-GCST006464")
plot_data1 <- droplevels(plot_data1)
plot_data2 <- subset(plot_data, outcome == "Endometrial cancer (endometrioid histology) || id:ebi-a-GCST006465")
plot_data2 <- droplevels(plot_data2)
plot_data3 <- subset(plot_data, outcome == "Endometrial cancer (Non-endometrioid histology) || id:ebi-a-GCST006466")
plot_data3 <- droplevels(plot_data3)

# circos plot ====
pdf("adiposity_metabolites_endometrial_cancer/analysis/003_metabolite_endometrial/combined/figures/circosplot.pdf",
    width = 45, height = 45, pointsize = 30)
circos_plot(track_number = 3,
            track1_data = plot_data1,
            track2_data = plot_data2,
            track3_data = plot_data3,
            track1_type = "points",
            track2_type = "points",
            track3_type = "points",
            label_column = 15,
            section_column = 18,
            estimate_column = 30,
            pvalue_column = 9,
            pvalue_adjustment = 0.05,
            lower_ci = 31,
            upper_ci = 32,
            legend = T, 
            track1_label = "Endometrial cancer", track2_label = "Endometrioid cancer", track3_label = "Non-endometrioid cancer", pvalue_label = "P > 0.05",
            track1_height = 0.2,track2_height = 0.2,track3_height = 0.2,
            circle_size = 25)
dev.off()
