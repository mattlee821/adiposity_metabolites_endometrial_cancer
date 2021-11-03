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
export metabolite2=ApoB_by_ApoA1_int_imputed.txt
export metabolite3=Clinical_LDL_C_int_imputed.txt
export metabolite4=Creatinine_int_imputed.txt
export metabolite5=Glucose_int_imputed.txt
export metabolite6=GlycA_int_imputed.txt
export metabolite7=HDL_TG_int_imputed.txt
export metabolite8=IDL_P_int_imputed.txt
export metabolite9=IDL_TG_pct_int_imputed.txt
export metabolite10=LDL_CE_int_imputed.txt
export metabolite11=LDL_C_int_imputed.txt
export metabolite12=LDL_L_int_imputed.txt
export metabolite13=LDL_P_int_imputed.txt
export metabolite14=LDL_PL_int_imputed.txt
export metabolite15=L_HDL_TG_int_imputed.txt
export metabolite16=L_LDL_P_int_imputed.txt
export metabolite17=L_LDL_PL_int_imputed.txt
export metabolite18=L_VLDL_CE_int_imputed.txt
export metabolite19=L_VLDL_PL_pct_int_imputed.txt
export metabolite20=M_HDL_TG_pct_int_imputed.txt
export metabolite21=M_LDL_CE_int_imputed.txt
export metabolite22=M_LDL_CE_pct_int_imputed.txt
export metabolite23=M_LDL_C_int_imputed.txt
export metabolite24=M_LDL_FC_int_imputed.txt
export metabolite25=M_LDL_L_int_imputed.txt
export metabolite26=M_LDL_P_int_imputed.txt
export metabolite27=M_VLDL_C_int_imputed.txt
export metabolite28=M_VLDL_TG_pct_int_imputed.txt
export metabolite29=non_HDL_C_int_imputed.txt
export metabolite30=Remnant_C_int_imputed.txt
export metabolite31=SFA_pct_int_imputed.txt
export metabolite32=S_HDL_TG_pct_int_imputed.txt
export metabolite33=S_LDL_CE_pct_int_imputed.txt
export metabolite34=S_LDL_C_int_imputed.txt
export metabolite35=S_LDL_L_int_imputed.txt
export metabolite36=S_VLDL_C_int_imputed.txt
export metabolite37=S_VLDL_FC_int_imputed.txt
export metabolite38=S_VLDL_TG_int_imputed.txt
export metabolite39=S_VLDL_TG_pct_int_imputed.txt
export metabolite40=TG_by_PG_int_imputed.txt
export metabolite41=Total_TG_int_imputed.txt
export metabolite42=Val_int_imputed.txt
export metabolite43=XL_HDL_TG_int_imputed.txt
export metabolite44=XS_VLDL_TG_int_imputed.txt
export metabolite45=XS_VLDL_TG_pct_int_imputed.txt

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
grep -w -F -f ${BMI_SNP_DIR}/${metabolite20} ${METABOLITE_DIR}/${metabolite20} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite20}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite21} ${METABOLITE_DIR}/${metabolite21} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite21}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite22} ${METABOLITE_DIR}/${metabolite22} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite22}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite23} ${METABOLITE_DIR}/${metabolite23} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite23}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite24} ${METABOLITE_DIR}/${metabolite24} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite24}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite25} ${METABOLITE_DIR}/${metabolite25} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite25}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite26} ${METABOLITE_DIR}/${metabolite26} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite26}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite27} ${METABOLITE_DIR}/${metabolite27} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite27}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite28} ${METABOLITE_DIR}/${metabolite28} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite28}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite29} ${METABOLITE_DIR}/${metabolite29} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite29}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite30} ${METABOLITE_DIR}/${metabolite30} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite30}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite31} ${METABOLITE_DIR}/${metabolite31} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite31}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite32} ${METABOLITE_DIR}/${metabolite32} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite32}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite33} ${METABOLITE_DIR}/${metabolite33} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite33}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite34} ${METABOLITE_DIR}/${metabolite34} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite34}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite35} ${METABOLITE_DIR}/${metabolite35} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite35}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite36} ${METABOLITE_DIR}/${metabolite36} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite36}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite37} ${METABOLITE_DIR}/${metabolite37} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite37}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite38} ${METABOLITE_DIR}/${metabolite38} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite38}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite39} ${METABOLITE_DIR}/${metabolite39} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite39}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite40} ${METABOLITE_DIR}/${metabolite40} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite40}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite41} ${METABOLITE_DIR}/${metabolite41} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite41}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite42} ${METABOLITE_DIR}/${metabolite42} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite42}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite43} ${METABOLITE_DIR}/${metabolite43} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite43}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite44} ${METABOLITE_DIR}/${metabolite44} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite44}
grep -w -F -f ${BMI_SNP_DIR}/${metabolite45} ${METABOLITE_DIR}/${metabolite45} > ${BMI_INSTRUMENTS_SNP_DIR}/${metabolite45}

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
grep -w -F -f ${WHR_SNP_DIR}/${metabolite20} ${METABOLITE_DIR}/${metabolite20} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite20}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite21} ${METABOLITE_DIR}/${metabolite21} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite21}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite22} ${METABOLITE_DIR}/${metabolite22} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite22}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite23} ${METABOLITE_DIR}/${metabolite23} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite23}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite24} ${METABOLITE_DIR}/${metabolite24} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite24}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite25} ${METABOLITE_DIR}/${metabolite25} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite25}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite26} ${METABOLITE_DIR}/${metabolite26} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite26}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite27} ${METABOLITE_DIR}/${metabolite27} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite27}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite28} ${METABOLITE_DIR}/${metabolite28} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite28}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite29} ${METABOLITE_DIR}/${metabolite29} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite29}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite30} ${METABOLITE_DIR}/${metabolite30} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite30}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite31} ${METABOLITE_DIR}/${metabolite31} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite31}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite32} ${METABOLITE_DIR}/${metabolite32} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite32}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite33} ${METABOLITE_DIR}/${metabolite33} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite33}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite34} ${METABOLITE_DIR}/${metabolite34} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite34}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite35} ${METABOLITE_DIR}/${metabolite35} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite35}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite36} ${METABOLITE_DIR}/${metabolite36} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite36}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite37} ${METABOLITE_DIR}/${metabolite37} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite37}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite38} ${METABOLITE_DIR}/${metabolite38} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite38}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite39} ${METABOLITE_DIR}/${metabolite39} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite39}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite40} ${METABOLITE_DIR}/${metabolite40} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite40}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite41} ${METABOLITE_DIR}/${metabolite41} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite41}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite42} ${METABOLITE_DIR}/${metabolite42} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite42}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite43} ${METABOLITE_DIR}/${metabolite43} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite43}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite44} ${METABOLITE_DIR}/${metabolite44} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite44}
grep -w -F -f ${WHR_SNP_DIR}/${metabolite45} ${METABOLITE_DIR}/${metabolite45} > ${WHR_INSTRUMENTS_SNP_DIR}/${metabolite45}

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
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite20} ${METABOLITE_DIR}/${metabolite20} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite20}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite21} ${METABOLITE_DIR}/${metabolite21} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite21}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite22} ${METABOLITE_DIR}/${metabolite22} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite22}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite23} ${METABOLITE_DIR}/${metabolite23} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite23}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite24} ${METABOLITE_DIR}/${metabolite24} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite24}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite25} ${METABOLITE_DIR}/${metabolite25} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite25}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite26} ${METABOLITE_DIR}/${metabolite26} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite26}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite27} ${METABOLITE_DIR}/${metabolite27} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite27}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite28} ${METABOLITE_DIR}/${metabolite28} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite28}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite29} ${METABOLITE_DIR}/${metabolite29} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite29}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite30} ${METABOLITE_DIR}/${metabolite30} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite30}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite31} ${METABOLITE_DIR}/${metabolite31} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite31}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite32} ${METABOLITE_DIR}/${metabolite32} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite32}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite33} ${METABOLITE_DIR}/${metabolite33} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite33}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite34} ${METABOLITE_DIR}/${metabolite34} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite34}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite35} ${METABOLITE_DIR}/${metabolite35} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite35}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite36} ${METABOLITE_DIR}/${metabolite36} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite36}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite37} ${METABOLITE_DIR}/${metabolite37} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite37}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite38} ${METABOLITE_DIR}/${metabolite38} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite38}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite39} ${METABOLITE_DIR}/${metabolite39} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite39}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite40} ${METABOLITE_DIR}/${metabolite40} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite40}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite41} ${METABOLITE_DIR}/${metabolite41} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite41}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite42} ${METABOLITE_DIR}/${metabolite42} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite42}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite43} ${METABOLITE_DIR}/${metabolite43} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite43}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite44} ${METABOLITE_DIR}/${metabolite44} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite44}
grep -w -F -f ${WHRadjBMI_SNP_DIR}/${metabolite45} ${METABOLITE_DIR}/${metabolite45} > ${WHRadjBMI_INSTRUMENTS_SNP_DIR}/${metabolite45}
