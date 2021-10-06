###########################
#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=100:00:00
#PBS -e log/
#PBS -o log/

export METABOLITE_DIR=/newhome/ml16847/001_projects/UKB_NMR_GWAS/nmr_dat_female

export BMI_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/bmi
export WHR_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/whr
export WHRadjBMI_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/snp_lists/whradjbmi

export BMI_INSTRUMENTS_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/bmi
export WHR_INSTRUMENTS_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/whr
export WHRadjBMI_INSTRUMENTS_SNP_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/metabolite_instruments/whradjbmi

export metabolite1=Ala_int_imputed.txt
export metabolite2=IDL_TG_pct_int_imputed.txt
export metabolite3=M_VLDL_TG_pct_int_imputed.txt
export metabolite4=S_VLDL_TG_int_imputed.txt
export metabolite5=Total_TG_int_imputed.txt
export metabolite6=XS_VLDL_TG_pct_int_imputed.txt
export metabolite7=GlycA_int_imputed.txt
export metabolite8=L_VLDL_PL_pct_int_imputed.tx
export metabolite9=S_HDL_TG_pct_int_imputed.txt
export metabolite10=S_VLDL_TG_pct_int_imputed.txt
export metabolite11=XL_HDL_TG_int_imputed.txt
export metabolite12=HDL_TG_int_imputed.txt
export metabolite13=M_HDL_TG_pct_int_imputed.txt
export metabolite14=S_LDL_CE_pct_int_imputed.txt
export metabolite15=TG_by_PG_int_imputed.txt
export metabolite16=XS_VLDL_TG_int_imputed.txt

# grep instruments from each GWAS file for BMI adjusted metabolites
grep -w -F -f ${BMI_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite1} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite16}

# grep instruments from each GWAS file for WHR adjusted metabolites
grep -w -F -f ${WHR_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite1} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite16}

# grep instruments from each GWAS file for WHRadjBMI adjusted metabolites
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite1} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite1}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite2} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite2}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite3} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite3}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite4} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite4}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite5} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite5}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite6} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite6}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite7} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite7}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite8} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite8}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite9} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite9}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite10} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite10}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite11} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite11}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite12} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite12}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite13} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite13}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite14} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite14}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite15} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite15}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite16} ${METABOLITE_DIR}/${metabolite1} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite16}

