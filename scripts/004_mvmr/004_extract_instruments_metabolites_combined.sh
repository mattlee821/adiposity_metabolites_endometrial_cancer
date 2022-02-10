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

export metabolite1=Ala_int.imputed.txt
export metabolite2=HDL_TG_int.imputed.txt
export metabolite3=IDL_PL_pct_int.imputed.txt
export metabolite4=L_HDL_CE_pct_int.imputed.txt
export metabolite5=L_HDL_L_int.imputed.txt
export metabolite6=L_LDL_C_int.imputed.txt
export metabolite7=LA_int.imputed.txt
export metabolite8=LDL_C_int.imputed.txt
export metabolite9=LDL_CE_int.imputed.txt
export metabolite10=LDL_P_int.imputed.txt
export metabolite11=M_HDL_CE_pct_int.imputed.txt
export metabolite12=M_LDL_FC_pct_int.imputed.txt
export metabolite13=S_HDL_TG_pct_int.imputed.txt
export metabolite14=S_VLDL_C_pct_int.imputed.txt
export metabolite15=S_VLDL_TG_int.imputed.txt
export metabolite16=S_VLDL_TG_pct_int.imputed.txt
export metabolite17=XS_VLDL_C_int.imputed.txt
export metabolite18=XS_VLDL_CE_pct_int.imputed.txt
export metabolite19=XS_VLDL_PL_pct_int.imputed.txt

# grep instruments from each GWAS file for BMI adjusted metabolites
grep -w -F -f ${BMI_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite2} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite3} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite4} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite5} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite6} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite7} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite8} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite9} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite10} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite11} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite12} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite13} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite14} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite15} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite16} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite16}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite17} ${METABOLITE_DIR}/${metabolite17} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite17}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite18} ${METABOLITE_DIR}/${metabolite18} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite18}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite19} ${METABOLITE_DIR}/${metabolite19} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite19}

# grep instruments from each GWAS file for WHR adjusted metabolites
grep -w -F -f ${WHR_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite2} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite3} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite4} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite5} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite6} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite7} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite8} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite9} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite10} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite11} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite12} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite13} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite14} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite15} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite16} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite16}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite17} ${METABOLITE_DIR}/${metabolite17} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite17}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite18} ${METABOLITE_DIR}/${metabolite18} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite18}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite19} ${METABOLITE_DIR}/${metabolite19} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite19}

# grep instruments from each GWAS file for WHRadjBMI adjusted metabolites
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite2} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite3} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite4} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite5} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite6} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite7} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite8} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite9} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite10} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite11} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite12} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite13} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite14} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite15} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite16} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite16}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite17} ${METABOLITE_DIR}/${metabolite17} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite17}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite18} ${METABOLITE_DIR}/${metabolite18} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite18}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite19} ${METABOLITE_DIR}/${metabolite19} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite19}
