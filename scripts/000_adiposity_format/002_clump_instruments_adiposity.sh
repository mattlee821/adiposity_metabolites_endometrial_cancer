#!/bin/bash

#SBATCH --job-name=extract_metab_instruments
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=100M

# set environment arguments 
source ../../environment/environment.sh
# must also set a .Renviron file in the same location as the script

# working directory
cd ${directory_1}adiposity_metabolites_endometrial_cancer/scripts

# script
module add languages/R-4.0.3-gcc9.1.0

VAR1=002_clump_instruments_adiposity.R

Rscript ${directory_1}adiposity_metabolites_endometrial_cancer/scripts/000_adiposity_format/${VAR1}

