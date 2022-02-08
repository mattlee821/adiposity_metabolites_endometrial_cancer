#!/bin/bash

#SBATCH --job-name=MR-analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=1000M

# set environment arguments 
source ../../environment/environment.sh

# working directory
cd ${directory_1}adiposity_metabolites_endometrial_cancer/scripts

module add lang/r/4.0.3-bioconductor-gcc

VAR1=004_adiposity_metabolite_MR_female.R
VAR2=004_adiposity_metabolite_MR_combined.R

Rscript ${directory_1}adiposity_metabolites_endometrial_cancer/scripts/002_adiposity_metabolite/${VAR1}

Rscript ${directory_1}adiposity_metabolites_endometrial_cancer/scripts/002_adiposity_metabolite/${VAR2}
