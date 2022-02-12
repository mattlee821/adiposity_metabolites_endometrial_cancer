export ADIPOSITY_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS

export SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists

export INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments

# grep instruments from BMI GWAS 
grep -w -F -f ${SNP_DIR}/bmi_whr_female.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${INSTRUMENTS_SNP_DIR}/BMI_adj_WHR_female.txt

# grep instruments from WHR GWAS 
grep -w -F -f ${SNP_DIR}/bmi_whr_female.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${INSTRUMENTS_SNP_DIR}/WHR_adj_BMI_female.txt


export ADIPOSITY_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS

export SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists

export INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments

# grep instruments from BMI GWAS 
grep -w -F -f ${SNP_DIR}/bmi_whr_combined.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.combined.23May2018.txt > ${INSTRUMENTS_SNP_DIR}/BMI_adj_WHR_combined.txt

# grep instruments from WHR GWAS 
grep -w -F -f ${SNP_DIR}/bmi_whr_combined.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.combined.23May2018.txt > ${INSTRUMENTS_SNP_DIR}/WHR_adj_BMI_combined.txt
