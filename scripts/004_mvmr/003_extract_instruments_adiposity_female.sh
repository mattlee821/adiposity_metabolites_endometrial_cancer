#!/bin/bash

#SBATCH --job-name=extract-instruments-female
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=100000M

export ADIPOSITY_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS/

export BMI_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists/bmi
export WHR_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists/whr
export WHRadjBMI_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/snp_lists/whradjbmi

export BMI_INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/bmi
export WHR_INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/whr
export WHRadjBMI_INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/whradjbmi

export BMI=bmi.giant-ukbb.meta-analysis.females.23May2018.txt
export WHR=whr.giant-ukbb.meta-analysis.females.23May2018.txt
export WHRadjBMI=whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt

# grep instruments from each GWAS file for BMI
grep -w -F -f ${BMI_SNP_DIR}/Ala_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/Ala_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/Clinical_LDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/Clinical_LDL_C_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/GlycA_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/GlycA_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/HDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/HDL_CE_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/HDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/IDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/IDL_C_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/IDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/IDL_FC_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/IDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/IDL_FC_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/IDL_P_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/IDL_P_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/IDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/IDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_HDL_C_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_HDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_HDL_CE_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_HDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_LDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_LDL_C_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_LDL_FC_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_LDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_LDL_FC_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_LDL_P_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_LDL_P_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_LDL_PL_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_LDL_PL_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/LDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/LDL_C_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/LDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/LDL_CE_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/LDL_L_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/LDL_L_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/LDL_PL_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/LDL_PL_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_HDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_HDL_CE_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_HDL_C_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_LDL_FC_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_LDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_LDL_FC_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_VLDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_VLDL_CE_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_VLDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_VLDL_C_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_VLDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_VLDL_FC_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/non_HDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/non_HDL_C_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/Remnant_C_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/Remnant_C_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_HDL_C_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_LDL_FC_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_VLDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_VLDL_C_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_VLDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_VLDL_CE_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/TG_by_PG_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/TG_by_PG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/Total_TG_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/Total_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XL_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/XL_HDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XS_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XS_VLDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_CE_pct_int_imputed.txt
grep -w -F -f ${BMI_SNP_DIR}/XS_VLDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${BMI} > ${BMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_C_pct_int_imputed.txt

# grep instruments from each GWAS file for WHR
grep -w -F -f ${WHR_SNP_DIR}/Ala_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/Ala_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/Clinical_LDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/Clinical_LDL_C_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/GlycA_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/GlycA_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/HDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/HDL_CE_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/HDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/IDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/IDL_C_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/IDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/IDL_FC_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/IDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/IDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/IDL_P_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/IDL_P_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/IDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/IDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_HDL_C_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_HDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_HDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_HDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_LDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_LDL_C_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_LDL_FC_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_LDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_LDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_LDL_P_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_LDL_P_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_LDL_PL_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_LDL_PL_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/LDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/LDL_C_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/LDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/LDL_CE_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/LDL_L_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/LDL_L_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/LDL_PL_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/LDL_PL_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_HDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_HDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_HDL_C_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_LDL_FC_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_LDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_LDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_VLDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_VLDL_CE_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_VLDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_VLDL_C_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_VLDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_VLDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/non_HDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/non_HDL_C_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/Remnant_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/Remnant_C_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_HDL_C_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_LDL_FC_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_VLDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_VLDL_C_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_VLDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_VLDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/TG_by_PG_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/TG_by_PG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/Total_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/Total_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XL_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/XL_HDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XS_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XS_VLDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/XS_VLDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHR_SNP_DIR}/XS_VLDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHR} > ${WHR_INSTRUMENTS_SNP_DIR}/XS_VLDL_C_pct_int_imputed.txt

# grep instruments from each GWAS file for WHRadjBMI
grep -w -F -f ${WHRadjBMI_SNP_DIR}/Ala_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/Ala_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/Clinical_LDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/Clinical_LDL_C_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/GlycA_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/GlycA_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/HDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/HDL_CE_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/HDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/IDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/IDL_C_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/IDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/IDL_FC_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/IDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/IDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/IDL_P_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/IDL_P_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/IDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/IDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_HDL_C_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_HDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_HDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_HDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_LDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_LDL_C_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_LDL_FC_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_LDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_LDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_LDL_P_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_LDL_P_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_LDL_PL_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_LDL_PL_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/L_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/LDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/LDL_C_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/LDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/LDL_CE_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/LDL_L_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/LDL_L_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/LDL_PL_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/LDL_PL_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_HDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_HDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_HDL_C_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_LDL_FC_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_LDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_LDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_VLDL_CE_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_VLDL_CE_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_VLDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_VLDL_C_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_VLDL_FC_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_VLDL_FC_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/M_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/non_HDL_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/non_HDL_C_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/Remnant_C_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/Remnant_C_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_HDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_HDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_HDL_C_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_LDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_LDL_FC_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_LDL_FC_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_VLDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_VLDL_C_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_VLDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_VLDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_VLDL_PL_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_VLDL_PL_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/S_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/TG_by_PG_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/TG_by_PG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/Total_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/Total_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XL_HDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XL_HDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XS_VLDL_TG_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_TG_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XS_VLDL_CE_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_CE_pct_int_imputed.txt
grep -w -F -f ${WHRadjBMI_SNP_DIR}/XS_VLDL_C_pct_int_imputed.txt ${ADIPOSITY_DIR}/${WHRadjBMI} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/XS_VLDL_C_pct_int_imputed.txt
