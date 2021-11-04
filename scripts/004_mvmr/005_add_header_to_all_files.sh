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
head -1 ${METABOLITE_DIR}/Ala_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Ala_int_imputed.txt
head -1 ${METABOLITE_DIR}/ApoB_by_ApoA1_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/ApoB_by_ApoA1_int_imputed.txt
head -1 ${METABOLITE_DIR}/Clinical_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Clinical_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/Creatinine_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Creatinine_int_imputed.txt
head -1 ${METABOLITE_DIR}/Glucose_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Glucose_int_imputed.txt
head -1 ${METABOLITE_DIR}/GlycA_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/GlycA_int_imputed.txt
head -1 ${METABOLITE_DIR}/HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/IDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/IDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/IDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/IDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_PL_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_PL_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_LDL_PL_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_LDL_PL_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_VLDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_VLDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_VLDL_PL_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_VLDL_PL_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_HDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_HDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_CE_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_CE_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_FC_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_FC_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_VLDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_VLDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_VLDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/non_HDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/non_HDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/Remnant_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Remnant_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/SFA_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/SFA_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_HDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_HDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_CE_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_CE_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_FC_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_FC_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/TG_by_PG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/TG_by_PG_int_imputed.txt
head -1 ${METABOLITE_DIR}/Total_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Total_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/Val_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Val_int_imputed.txt
head -1 ${METABOLITE_DIR}/XL_HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XL_HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/XS_VLDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XS_VLDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/XS_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XS_VLDL_TG_pct_int_imputed.txt

rm ${DATA_DIR}/header

# metabolite instruments adjusted for whr - we use Acetate_int_imputed.txt to extract header
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/whr
head -1 ${METABOLITE_DIR}/Ala_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Ala_int_imputed.txt
head -1 ${METABOLITE_DIR}/ApoB_by_ApoA1_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/ApoB_by_ApoA1_int_imputed.txt
head -1 ${METABOLITE_DIR}/Clinical_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Clinical_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/Creatinine_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Creatinine_int_imputed.txt
head -1 ${METABOLITE_DIR}/Glucose_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Glucose_int_imputed.txt
head -1 ${METABOLITE_DIR}/GlycA_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/GlycA_int_imputed.txt
head -1 ${METABOLITE_DIR}/HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/IDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/IDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/IDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/IDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_PL_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_PL_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_LDL_PL_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_LDL_PL_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_VLDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_VLDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_VLDL_PL_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_VLDL_PL_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_HDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_HDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_CE_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_CE_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_FC_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_FC_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_VLDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_VLDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_VLDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/non_HDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/non_HDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/Remnant_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Remnant_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/SFA_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/SFA_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_HDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_HDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_CE_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_CE_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_FC_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_FC_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/TG_by_PG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/TG_by_PG_int_imputed.txt
head -1 ${METABOLITE_DIR}/Total_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Total_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/Val_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Val_int_imputed.txt
head -1 ${METABOLITE_DIR}/XL_HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XL_HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/XS_VLDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XS_VLDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/XS_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XS_VLDL_TG_pct_int_imputed.txt

rm ${DATA_DIR}/header

# metabolite instruments adjusted for whradjbmi - we use Acetate_int_imputed.txt to extract header
export DATA_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/whradjbmi
head -1 ${METABOLITE_DIR}/Ala_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Ala_int_imputed.txt
head -1 ${METABOLITE_DIR}/ApoB_by_ApoA1_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/ApoB_by_ApoA1_int_imputed.txt
head -1 ${METABOLITE_DIR}/Clinical_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Clinical_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/Creatinine_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Creatinine_int_imputed.txt
head -1 ${METABOLITE_DIR}/Glucose_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Glucose_int_imputed.txt
head -1 ${METABOLITE_DIR}/GlycA_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/GlycA_int_imputed.txt
head -1 ${METABOLITE_DIR}/HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/IDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/IDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/IDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/IDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/LDL_PL_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/LDL_PL_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_LDL_PL_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_LDL_PL_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_VLDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_VLDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/L_VLDL_PL_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/L_VLDL_PL_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_HDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_HDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_CE_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_CE_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_CE_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_CE_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_FC_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_FC_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_LDL_P_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_LDL_P_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_VLDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_VLDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/M_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/M_VLDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/non_HDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/non_HDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/Remnant_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Remnant_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/SFA_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/SFA_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_HDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_HDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_CE_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_CE_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_LDL_L_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_LDL_L_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_C_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_C_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_FC_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_FC_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/S_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/S_VLDL_TG_pct_int_imputed.txt
head -1 ${METABOLITE_DIR}/TG_by_PG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/TG_by_PG_int_imputed.txt
head -1 ${METABOLITE_DIR}/Total_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Total_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/Val_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/Val_int_imputed.txt
head -1 ${METABOLITE_DIR}/XL_HDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XL_HDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/XS_VLDL_TG_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XS_VLDL_TG_int_imputed.txt
head -1 ${METABOLITE_DIR}/XS_VLDL_TG_pct_int_imputed.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/XS_VLDL_TG_pct_int_imputed.txt

rm ${DATA_DIR}/header



