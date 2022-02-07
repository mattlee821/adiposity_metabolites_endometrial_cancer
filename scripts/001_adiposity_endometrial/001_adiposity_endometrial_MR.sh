###########################
#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=300:00:00
#PBS -e log/
#PBS -o log/

# set environment arguments 
source ../../environment/environment.sh
# must also set a .Renviron file in the same location as the script

# working directory
cd ${directory_1}adiposity_metabolites_endometrial_cancer/scripts

module add lang/r/4.0.3-bioconductor-gcc

VAR1=001_adiposity_endometrial_MR_female.R
VAR2=001_adiposity_endometrial_MR_combined.R

Rscript ${directory_1}adiposity_metabolites_endometrial_cancer/scripts/001_adiposity_endometrial/${VAR1}

Rscript ${directory_1}adiposity_metabolites_endometrial_cancer/scripts/001_adiposity_endometrial/${VAR2}
