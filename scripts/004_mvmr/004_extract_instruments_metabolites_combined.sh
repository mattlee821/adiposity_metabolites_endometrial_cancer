#!/bin/bash

#SBATCH --job-name=extract-instruments-female
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=100000M

export METABOLITE_DIR=/user/work/ml16847/UKB_NMR_GWAS/nmr_dat_all

export BMI_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists/bmi
export WHR_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists/whr
export WHRadjBMI_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/snp_lists/whradjbmi

export BMI_INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/metabolite_instruments/bmi
export WHR_INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/metabolite_instruments/whr
export WHRadjBMI_INSTRUMENTS_SNP_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/metabolite_instruments/whradjbmi

export metabolite1=Ala_int_imputed.txt
export metabolite2=HDL_TG_int_imputed.txt
export metabolite3=IDL_PL_pct_int_imputed.txt
export metabolite4=L_HDL_CE_pct_int_imputed.txt
export metabolite5=L_HDL_L_int_imputed.txt
export metabolite6=L_LDL_C_int_imputed.txt
export metabolite7=LA_int_imputed.txt
export metabolite8=LDL_C_int_imputed.txt
export metabolite9=LDL_CE_int_imputed.txt
export metabolite10=LDL_P_int_imputed.txt
export metabolite11=M_HDL_CE_pct_int_imputed.txt
export metabolite12=M_LDL_FC_pct_int_imputed.txt
export metabolite13=S_HDL_TG_pct_int_imputed.txt
export metabolite14=S_VLDL_C_pct_int_imputed.txt
export metabolite15=S_VLDL_TG_int_imputed.txt
export metabolite16=S_VLDL_TG_pct_int_imputed.txt
export metabolite17=XS_VLDL_C_int_imputed.txt
export metabolite18=XS_VLDL_CE_pct_int_imputed.txt
export metabolite19=XS_VLDL_PL_pct_int_imputed.txt

export metabolite1a=Ala_int.imputed.txt
export metabolite2a=HDL_TG_int.imputed.txt
export metabolite3a=IDL_PL_pct_int.imputed.txt
export metabolite4a=L_HDL_CE_pct_int.imputed.txt
export metabolite5a=L_HDL_L_int.imputed.txt
export metabolite6a=L_LDL_C_int.imputed.txt
export metabolite7a=LA_int.imputed.txt
export metabolite8a=LDL_C_int.imputed.txt
export metabolite9a=LDL_CE_int.imputed.txt
export metabolite10a=LDL_P_int.imputed.txt
export metabolite11a=M_HDL_CE_pct_int.imputed.txt
export metabolite12a=M_LDL_FC_pct_int.imputed.txt
export metabolite13a=S_HDL_TG_pct_int.imputed.txt
export metabolite14a=S_VLDL_C_pct_int.imputed.txt
export metabolite15a=S_VLDL_TG_int.imputed.txt
export metabolite16a=S_VLDL_TG_pct_int.imputed.txt
export metabolite17a=XS_VLDL_C_int.imputed.txt
export metabolite18a=XS_VLDL_CE_pct_int.imputed.txt
export metabolite19a=XS_VLDL_PL_pct_int.imputed.txt

# grep instruments from each GWAS file for BMI adjusted metabolites
grep -w -F -f ${BMI_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite2a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite3a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite4a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite5a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite6a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite7a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite8a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite9a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite10a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite11a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite12a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite13a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite14a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite15a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite16a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite16}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite17} ${METABOLITE_DIR}/${metabolite17a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite17}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite18} ${METABOLITE_DIR}/${metabolite18a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite18}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite19} ${METABOLITE_DIR}/${metabolite19a} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite19}

# grep instruments from each GWAS file for WHR adjusted metabolites
grep -w -F -f ${WHR_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite2a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite3a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite4a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite5a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite6a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite7a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite8a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite9a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite10a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite11a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite12a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite13a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite14a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite15a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite16a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite16}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite17} ${METABOLITE_DIR}/${metabolite17a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite17}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite18} ${METABOLITE_DIR}/${metabolite18a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite18}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite19} ${METABOLITE_DIR}/${metabolite19a} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite19}

# grep instruments from each GWAS file for WHRadjBMI adjusted metabolites
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite2a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite3a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite4a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite5a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite6a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite7a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite8a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite9a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite10a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite11a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite12a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite13a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite14a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite15a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite16a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite16}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite17} ${METABOLITE_DIR}/${metabolite17a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite17}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite18} ${METABOLITE_DIR}/${metabolite18a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite18}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite19} ${METABOLITE_DIR}/${metabolite19a} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite19}
