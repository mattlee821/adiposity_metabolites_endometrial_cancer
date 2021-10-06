###########################
#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=100:00:00
#PBS -e log/
#PBS -o log/

export ADIPOSITY_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data

export BMI_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/bmi
export WHR_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/whr
export WHRadjBMI_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/whradjbmi

export BMI_INSTRUMENTS_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/adiposity_instruments/bmi
export WHR_INSTRUMENTS_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/adiposity_instruments/whr
export WHRadjBMI_INSTRUMENTS_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/adiposity_instruments/whradjbmi

# grep instruments from each GWAS file for BMI
grep -w -F -f ${BMI_SNP_DIR}/Ala_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/Ala_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/IDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/IDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/Total_TG_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/Total_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/GlycA_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/GlycA_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XL_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/XL_HDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/HDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/TG_by_PG_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/TG_by_PG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XS_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${BMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_int_imputed.txt

# grep instruments from each GWAS file for WHR
grep -w -F -f ${WHR_SNP_DIR}/Ala_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/Ala_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/IDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/IDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/Total_TG_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/Total_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/GlycA_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/GlycA_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XL_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/XL_HDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/HDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/TG_by_PG_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/TG_by_PG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XS_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHR_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_int_imputed.txt

# grep instruments from each GWAS file for WHRadjBMI
grep -w -F -f ${WHRadjBMI_SNP_DIR}/Ala_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/Ala_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/IDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/IDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/Total_TG_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/Total_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/GlycA_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/GlycA_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XL_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XL_HDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/HDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/TG_by_PG_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/TG_by_PG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XS_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_int_imputed.txt


