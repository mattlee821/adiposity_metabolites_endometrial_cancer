export ADIPOSITY_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS

# female
# bmi instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments
head -1 ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/BMI_adj_WHR_female.txt
rm ${DATA_DIR}/header

# whr instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments
head -1 ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/WHR_adj_BMI_female.txt
rm ${DATA_DIR}/header


# combined
# bmi instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments
head -1 ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.combined.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/BMI_adj_WHR_combined.txt
rm ${DATA_DIR}/header

# whr instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments
head -1 ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.combined.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/WHR_adj_BMI_combined.txt
rm ${DATA_DIR}/header
