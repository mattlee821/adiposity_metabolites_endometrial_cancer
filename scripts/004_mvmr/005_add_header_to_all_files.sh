###########################
#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=100:00:00
#PBS -e log/
#PBS -o log/

export ADIPOSITY_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data
export METABOLITE_DIR=/newhome/ml16847/001_projects/UKB_NMR_GWAS/nmr_dat_female

# bmi instruments 
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/adiposity_instruments/bmi
head -1 ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# whr instruments 
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/adiposity_instruments/whr
head -1 ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# whradjbmi instruments 
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/adiposity_instruments/whradjbmi
head -1 ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# metabolite instruments adjusted for bmi - we use Acetate_int_imputed.txt to extract header
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/bmi
head -1 ${METABOLITE_DIR}/Acetate_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# metabolite instruments adjusted for whr - we use Acetate_int_imputed.txt to extract header
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/whr
head -1 ${METABOLITE_DIR}/Acetate_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# metabolite instruments adjusted for whradjbmi - we use Acetate_int_imputed.txt to extract header
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/whradjbmi
head -1 ${METABOLITE_DIR}/Acetate_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header




