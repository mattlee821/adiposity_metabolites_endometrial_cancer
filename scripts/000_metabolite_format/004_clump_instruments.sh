#!/bin/bash

#SBATCH --job-name=MR-analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=10000M

# set environment arguments 
source ../../environment/environment.sh

# working directory
cd ${directory_1}adiposity_metabolites_endometrial_cancer/scripts

module add lang/r/4.0.3-bioconductor-gcc

VAR1=004_clump_instruments_female.R
VAR2=004_clump_instruments_combined.R

Rscript ${directory_1}adiposity_metabolites_endometrial_cancer/scripts/000_metabolite_format/${VAR1}
Rscript ${directory_1}adiposity_metabolites_endometrial_cancer/scripts/000_metabolite_format/${VAR2}
