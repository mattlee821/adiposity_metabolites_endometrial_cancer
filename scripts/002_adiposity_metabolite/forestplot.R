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

# data ====
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/001_mr_results_bonferroni.txt", header = T, sep = "\t")
metabolites <- data$metabolite
data <- read.table("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/001_mr_results.txt", header = T, sep = "\t")
data <- data[data$metabolite %in% metabolites,]

plot_data <- data 
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
plot_data <- droplevels(plot_data)
psignif <- 0.05
ci <- 0.95

pdf("adiposity_metabolites_endometrial_cancer/analysis/002_adiposity_metabolite/combined/forestplot.pdf",
    width = 10, height = 45, pointsize = 10)
forestplot(df = plot_data,
           name = metabolite,
           estimate = b,
           pvalue = pval,
           psignif = psignif,
           ci = ci,
           se = se,
           colour = exposure,
           logodds = F) +
  scale_color_manual(values = c(discrete_palette[3], discrete_palette[1], discrete_palette[5])) +
  ggforce::facet_col(facets = ~UKB_subclass,
                     scales = "free_y",
                     space = "free") +
  theme(axis.title.x = element_blank()) +
  theme(legend.title = element_blank())
dev.off()
