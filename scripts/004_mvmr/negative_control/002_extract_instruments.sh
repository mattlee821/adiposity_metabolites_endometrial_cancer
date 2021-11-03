###########################
#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=100:00:00
#PBS -e log/
#PBS -o log/

export ADIPOSITY_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data

export SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/

export INSTRUMENTS_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/adiposity_instruments/

# grep instruments from BMI GWAS 
grep -w -F -f ${SNP_DIR}/bmi_whr.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${INSTRUMENTS_SNP_DIR}/BMI_adj_WHR.txt

# grep instruments from WHR GWAS 
grep -w -F -f ${SNP_DIR}/bmi_whr.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${INSTRUMENTS_SNP_DIR}/WHR_adj_BMI.txt
