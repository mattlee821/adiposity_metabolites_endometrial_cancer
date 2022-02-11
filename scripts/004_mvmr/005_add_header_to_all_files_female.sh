#!/bin/bash

#SBATCH --job-name=extract-instruments-female
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=100000M

export ADIPOSITY_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS
export METABOLITE_DIR=/user/work/ml16847/UKB_NMR_GWAS/nmr_dat_female

# bmi instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/bmi
head -1 ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# whr instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/whr
head -1 ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# whradjbmi instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/adiposity_instruments/whradjbmi
head -1 ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.females.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# metabolite headers
export metabolite1=Ala_int_imputed.txt
export metabolite2=Clinical_LDL_C_int_imputed.txt
export metabolite3=GlycA_int_imputed.txt
export metabolite4=HDL_CE_int_imputed.txt
export metabolite5=HDL_TG_int_imputed.txt
export metabolite6=IDL_C_int_imputed.txt
export metabolite7=IDL_FC_int_imputed.txt
export metabolite8=IDL_FC_pct_int_imputed.txt
export metabolite9=IDL_P_int_imputed.txt
export metabolite10=IDL_TG_pct_int_imputed.txt
export metabolite11=LDL_CE_int_imputed.txt
export metabolite12=LDL_C_int_imputed.txt
export metabolite13=LDL_L_int_imputed.txt
export metabolite14=LDL_PL_int_imputed.txt
export metabolite15=L_HDL_CE_pct_int_imputed.txt
export metabolite16=L_HDL_C_pct_int_imputed.txt
export metabolite17=L_HDL_TG_int_imputed.txt
export metabolite18=L_LDL_C_pct_int_imputed.txt
export metabolite19=L_LDL_FC_int_imputed.txt
export metabolite20=L_LDL_FC_pct_int_imputed.txt
export metabolite21=L_LDL_P_int_imputed.txt
export metabolite22=L_LDL_PL_int_imputed.txt
export metabolite23=L_VLDL_PL_pct_int_imputed.txt
export metabolite24=M_HDL_CE_pct_int_imputed.txt
export metabolite25=M_HDL_C_pct_int_imputed.txt
export metabolite26=M_HDL_TG_pct_int_imputed.txt
export metabolite27=M_LDL_FC_int_imputed.txt
export metabolite28=M_LDL_FC_pct_int_imputed.txt
export metabolite29=M_VLDL_CE_int_imputed.txt
export metabolite30=M_VLDL_C_int_imputed.txt
export metabolite31=M_VLDL_FC_pct_int_imputed.txt
export metabolite32=M_VLDL_PL_pct_int_imputed.txt
export metabolite33=M_VLDL_TG_pct_int_imputed.txt
export metabolite34=S_LDL_CE_pct_int_imputed.txt
export metabolite35=S_LDL_FC_int_imputed.txt
export metabolite36=S_VLDL_CE_pct_int_imputed.txt
export metabolite37=S_VLDL_C_pct_int_imputed.txt
export metabolite38=S_VLDL_PL_pct_int_imputed.txt
export metabolite39=S_VLDL_TG_int_imputed.txt
export metabolite40=S_VLDL_TG_pct_int_imputed.txt
export metabolite41=XS_VLDL_TG_int_imputed.txt
export metabolite42=XS_VLDL_TG_pct_int_imputed.txt
export metabolite43=non_HDL_C_int_imputed.txt
export metabolite44=Remnant_C_int_imputed.txt
export metabolite45=S_HDL_TG_pct_int_imputed.txt
export metabolite46=Total_TG_int_imputed.txt
export metabolite47=TG_by_PG_int_imputed.txt
export metabolite48=XL_HDL_TG_int_imputed.txt
export metabolite49=S_HDL_C_pct_int_imputed.txt
export metabolite50=XS_VLDL_CE_pct_int_imputed.txt
export metabolite51=XS_VLDL_C_pct_int_imputed.txt

# header
export HEADER=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/metabolite_instruments/header
head -1 ${METABOLITE_DIR}/${metabolite1} > ${HEADER}/${metabolite1}
head -1 ${METABOLITE_DIR}/${metabolite2} > ${HEADER}/${metabolite2}
head -1 ${METABOLITE_DIR}/${metabolite3} > ${HEADER}/${metabolite3}
head -1 ${METABOLITE_DIR}/${metabolite4} > ${HEADER}/${metabolite4}
head -1 ${METABOLITE_DIR}/${metabolite5} > ${HEADER}/${metabolite5}
head -1 ${METABOLITE_DIR}/${metabolite6} > ${HEADER}/${metabolite6}
head -1 ${METABOLITE_DIR}/${metabolite7} > ${HEADER}/${metabolite7}
head -1 ${METABOLITE_DIR}/${metabolite8} > ${HEADER}/${metabolite8}
head -1 ${METABOLITE_DIR}/${metabolite9} > ${HEADER}/${metabolite9}
head -1 ${METABOLITE_DIR}/${metabolite10} > ${HEADER}/${metabolite10}
head -1 ${METABOLITE_DIR}/${metabolite11} > ${HEADER}/${metabolite11}
head -1 ${METABOLITE_DIR}/${metabolite12} > ${HEADER}/${metabolite12}
head -1 ${METABOLITE_DIR}/${metabolite13} > ${HEADER}/${metabolite13}
head -1 ${METABOLITE_DIR}/${metabolite14} > ${HEADER}/${metabolite14}
head -1 ${METABOLITE_DIR}/${metabolite15} > ${HEADER}/${metabolite15}
head -1 ${METABOLITE_DIR}/${metabolite16} > ${HEADER}/${metabolite16}
head -1 ${METABOLITE_DIR}/${metabolite17} > ${HEADER}/${metabolite17}
head -1 ${METABOLITE_DIR}/${metabolite18} > ${HEADER}/${metabolite18}
head -1 ${METABOLITE_DIR}/${metabolite19} > ${HEADER}/${metabolite19}
head -1 ${METABOLITE_DIR}/${metabolite20} > ${HEADER}/${metabolite20}
head -1 ${METABOLITE_DIR}/${metabolite21} > ${HEADER}/${metabolite21}
head -1 ${METABOLITE_DIR}/${metabolite22} > ${HEADER}/${metabolite22}
head -1 ${METABOLITE_DIR}/${metabolite23} > ${HEADER}/${metabolite23}
head -1 ${METABOLITE_DIR}/${metabolite24} > ${HEADER}/${metabolite24}
head -1 ${METABOLITE_DIR}/${metabolite25} > ${HEADER}/${metabolite25}
head -1 ${METABOLITE_DIR}/${metabolite26} > ${HEADER}/${metabolite26}
head -1 ${METABOLITE_DIR}/${metabolite27} > ${HEADER}/${metabolite27}
head -1 ${METABOLITE_DIR}/${metabolite28} > ${HEADER}/${metabolite28}
head -1 ${METABOLITE_DIR}/${metabolite29} > ${HEADER}/${metabolite29}
head -1 ${METABOLITE_DIR}/${metabolite30} > ${HEADER}/${metabolite30}
head -1 ${METABOLITE_DIR}/${metabolite31} > ${HEADER}/${metabolite31}
head -1 ${METABOLITE_DIR}/${metabolite32} > ${HEADER}/${metabolite32}
head -1 ${METABOLITE_DIR}/${metabolite33} > ${HEADER}/${metabolite33}
head -1 ${METABOLITE_DIR}/${metabolite34} > ${HEADER}/${metabolite34}
head -1 ${METABOLITE_DIR}/${metabolite35} > ${HEADER}/${metabolite35}
head -1 ${METABOLITE_DIR}/${metabolite36} > ${HEADER}/${metabolite36}
head -1 ${METABOLITE_DIR}/${metabolite37} > ${HEADER}/${metabolite37}
head -1 ${METABOLITE_DIR}/${metabolite38} > ${HEADER}/${metabolite38}
head -1 ${METABOLITE_DIR}/${metabolite39} > ${HEADER}/${metabolite39}
head -1 ${METABOLITE_DIR}/${metabolite40} > ${HEADER}/${metabolite40}
head -1 ${METABOLITE_DIR}/${metabolite41} > ${HEADER}/${metabolite41}
head -1 ${METABOLITE_DIR}/${metabolite42} > ${HEADER}/${metabolite42}
head -1 ${METABOLITE_DIR}/${metabolite43} > ${HEADER}/${metabolite43}
head -1 ${METABOLITE_DIR}/${metabolite44} > ${HEADER}/${metabolite44}
head -1 ${METABOLITE_DIR}/${metabolite45} > ${HEADER}/${metabolite45}
head -1 ${METABOLITE_DIR}/${metabolite46} > ${HEADER}/${metabolite46}
head -1 ${METABOLITE_DIR}/${metabolite47} > ${HEADER}/${metabolite47}
head -1 ${METABOLITE_DIR}/${metabolite48} > ${HEADER}/${metabolite48}
head -1 ${METABOLITE_DIR}/${metabolite49} > ${HEADER}/${metabolite49}
head -1 ${METABOLITE_DIR}/${metabolite50} > ${HEADER}/${metabolite50}
head -1 ${METABOLITE_DIR}/${metabolite51} > ${HEADER}/${metabolite51}

# bmi
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/metabolite_instruments/bmi
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite1})\n/" ${DATA_DIR}/${metabolite1}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite2})\n/" ${DATA_DIR}/${metabolite2}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite3})\n/" ${DATA_DIR}/${metabolite3}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite4})\n/" ${DATA_DIR}/${metabolite4}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite5})\n/" ${DATA_DIR}/${metabolite5}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite6})\n/" ${DATA_DIR}/${metabolite6}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite7})\n/" ${DATA_DIR}/${metabolite7}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite8})\n/" ${DATA_DIR}/${metabolite8}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite9})\n/" ${DATA_DIR}/${metabolite9}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite10})\n/" ${DATA_DIR}/${metabolite10}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite11})\n/" ${DATA_DIR}/${metabolite11}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite12})\n/" ${DATA_DIR}/${metabolite12}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite13})\n/" ${DATA_DIR}/${metabolite13}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite14})\n/" ${DATA_DIR}/${metabolite14}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite15})\n/" ${DATA_DIR}/${metabolite15}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite16})\n/" ${DATA_DIR}/${metabolite16}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite17})\n/" ${DATA_DIR}/${metabolite17}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite18})\n/" ${DATA_DIR}/${metabolite18}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite19})\n/" ${DATA_DIR}/${metabolite19}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite20})\n/" ${DATA_DIR}/${metabolite20}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite21})\n/" ${DATA_DIR}/${metabolite21}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite22})\n/" ${DATA_DIR}/${metabolite22}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite23})\n/" ${DATA_DIR}/${metabolite23}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite24})\n/" ${DATA_DIR}/${metabolite24}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite25})\n/" ${DATA_DIR}/${metabolite25}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite26})\n/" ${DATA_DIR}/${metabolite26}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite27})\n/" ${DATA_DIR}/${metabolite27}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite28})\n/" ${DATA_DIR}/${metabolite28}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite29})\n/" ${DATA_DIR}/${metabolite29}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite30})\n/" ${DATA_DIR}/${metabolite30}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite31})\n/" ${DATA_DIR}/${metabolite31}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite32})\n/" ${DATA_DIR}/${metabolite32}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite33})\n/" ${DATA_DIR}/${metabolite33}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite34})\n/" ${DATA_DIR}/${metabolite34}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite35})\n/" ${DATA_DIR}/${metabolite35}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite36})\n/" ${DATA_DIR}/${metabolite36}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite37})\n/" ${DATA_DIR}/${metabolite37}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite38})\n/" ${DATA_DIR}/${metabolite38}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite39})\n/" ${DATA_DIR}/${metabolite39}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite40})\n/" ${DATA_DIR}/${metabolite40}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite41})\n/" ${DATA_DIR}/${metabolite41}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite42})\n/" ${DATA_DIR}/${metabolite42}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite43})\n/" ${DATA_DIR}/${metabolite43}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite44})\n/" ${DATA_DIR}/${metabolite44}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite45})\n/" ${DATA_DIR}/${metabolite45}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite46})\n/" ${DATA_DIR}/${metabolite46}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite47})\n/" ${DATA_DIR}/${metabolite47}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite48})\n/" ${DATA_DIR}/${metabolite48}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite49})\n/" ${DATA_DIR}/${metabolite49}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite50})\n/" ${DATA_DIR}/${metabolite50}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite51})\n/" ${DATA_DIR}/${metabolite51}

# whr
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/metabolite_instruments/whr
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite1})\n/" ${DATA_DIR}/${metabolite1}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite2})\n/" ${DATA_DIR}/${metabolite2}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite3})\n/" ${DATA_DIR}/${metabolite3}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite4})\n/" ${DATA_DIR}/${metabolite4}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite5})\n/" ${DATA_DIR}/${metabolite5}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite6})\n/" ${DATA_DIR}/${metabolite6}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite7})\n/" ${DATA_DIR}/${metabolite7}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite8})\n/" ${DATA_DIR}/${metabolite8}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite9})\n/" ${DATA_DIR}/${metabolite9}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite10})\n/" ${DATA_DIR}/${metabolite10}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite11})\n/" ${DATA_DIR}/${metabolite11}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite12})\n/" ${DATA_DIR}/${metabolite12}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite13})\n/" ${DATA_DIR}/${metabolite13}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite14})\n/" ${DATA_DIR}/${metabolite14}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite15})\n/" ${DATA_DIR}/${metabolite15}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite16})\n/" ${DATA_DIR}/${metabolite16}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite17})\n/" ${DATA_DIR}/${metabolite17}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite18})\n/" ${DATA_DIR}/${metabolite18}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite19})\n/" ${DATA_DIR}/${metabolite19}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite20})\n/" ${DATA_DIR}/${metabolite20}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite21})\n/" ${DATA_DIR}/${metabolite21}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite22})\n/" ${DATA_DIR}/${metabolite22}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite23})\n/" ${DATA_DIR}/${metabolite23}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite24})\n/" ${DATA_DIR}/${metabolite24}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite25})\n/" ${DATA_DIR}/${metabolite25}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite26})\n/" ${DATA_DIR}/${metabolite26}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite27})\n/" ${DATA_DIR}/${metabolite27}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite28})\n/" ${DATA_DIR}/${metabolite28}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite29})\n/" ${DATA_DIR}/${metabolite29}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite30})\n/" ${DATA_DIR}/${metabolite30}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite31})\n/" ${DATA_DIR}/${metabolite31}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite32})\n/" ${DATA_DIR}/${metabolite32}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite33})\n/" ${DATA_DIR}/${metabolite33}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite34})\n/" ${DATA_DIR}/${metabolite34}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite35})\n/" ${DATA_DIR}/${metabolite35}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite36})\n/" ${DATA_DIR}/${metabolite36}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite37})\n/" ${DATA_DIR}/${metabolite37}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite38})\n/" ${DATA_DIR}/${metabolite38}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite39})\n/" ${DATA_DIR}/${metabolite39}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite40})\n/" ${DATA_DIR}/${metabolite40}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite41})\n/" ${DATA_DIR}/${metabolite41}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite42})\n/" ${DATA_DIR}/${metabolite42}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite43})\n/" ${DATA_DIR}/${metabolite43}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite44})\n/" ${DATA_DIR}/${metabolite44}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite45})\n/" ${DATA_DIR}/${metabolite45}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite46})\n/" ${DATA_DIR}/${metabolite46}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite47})\n/" ${DATA_DIR}/${metabolite47}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite48})\n/" ${DATA_DIR}/${metabolite48}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite49})\n/" ${DATA_DIR}/${metabolite49}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite50})\n/" ${DATA_DIR}/${metabolite50}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite51})\n/" ${DATA_DIR}/${metabolite51}

# whradjbmi
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/female/metabolite_instruments/whradjbmi
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite1})\n/" ${DATA_DIR}/${metabolite1}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite2})\n/" ${DATA_DIR}/${metabolite2}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite3})\n/" ${DATA_DIR}/${metabolite3}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite4})\n/" ${DATA_DIR}/${metabolite4}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite5})\n/" ${DATA_DIR}/${metabolite5}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite6})\n/" ${DATA_DIR}/${metabolite6}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite7})\n/" ${DATA_DIR}/${metabolite7}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite8})\n/" ${DATA_DIR}/${metabolite8}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite9})\n/" ${DATA_DIR}/${metabolite9}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite10})\n/" ${DATA_DIR}/${metabolite10}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite11})\n/" ${DATA_DIR}/${metabolite11}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite12})\n/" ${DATA_DIR}/${metabolite12}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite13})\n/" ${DATA_DIR}/${metabolite13}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite14})\n/" ${DATA_DIR}/${metabolite14}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite15})\n/" ${DATA_DIR}/${metabolite15}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite16})\n/" ${DATA_DIR}/${metabolite16}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite17})\n/" ${DATA_DIR}/${metabolite17}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite18})\n/" ${DATA_DIR}/${metabolite18}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite19})\n/" ${DATA_DIR}/${metabolite19}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite20})\n/" ${DATA_DIR}/${metabolite20}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite21})\n/" ${DATA_DIR}/${metabolite21}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite22})\n/" ${DATA_DIR}/${metabolite22}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite23})\n/" ${DATA_DIR}/${metabolite23}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite24})\n/" ${DATA_DIR}/${metabolite24}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite25})\n/" ${DATA_DIR}/${metabolite25}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite26})\n/" ${DATA_DIR}/${metabolite26}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite27})\n/" ${DATA_DIR}/${metabolite27}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite28})\n/" ${DATA_DIR}/${metabolite28}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite29})\n/" ${DATA_DIR}/${metabolite29}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite30})\n/" ${DATA_DIR}/${metabolite30}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite31})\n/" ${DATA_DIR}/${metabolite31}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite32})\n/" ${DATA_DIR}/${metabolite32}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite33})\n/" ${DATA_DIR}/${metabolite33}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite34})\n/" ${DATA_DIR}/${metabolite34}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite35})\n/" ${DATA_DIR}/${metabolite35}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite36})\n/" ${DATA_DIR}/${metabolite36}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite37})\n/" ${DATA_DIR}/${metabolite37}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite38})\n/" ${DATA_DIR}/${metabolite38}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite39})\n/" ${DATA_DIR}/${metabolite39}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite40})\n/" ${DATA_DIR}/${metabolite40}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite41})\n/" ${DATA_DIR}/${metabolite41}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite42})\n/" ${DATA_DIR}/${metabolite42}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite43})\n/" ${DATA_DIR}/${metabolite43}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite44})\n/" ${DATA_DIR}/${metabolite44}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite45})\n/" ${DATA_DIR}/${metabolite45}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite46})\n/" ${DATA_DIR}/${metabolite46}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite47})\n/" ${DATA_DIR}/${metabolite47}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite48})\n/" ${DATA_DIR}/${metabolite48}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite49})\n/" ${DATA_DIR}/${metabolite49}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite50})\n/" ${DATA_DIR}/${metabolite50}
sed -i "1s/^/$(head -n1 ${HEADER}/${metabolite51})\n/" ${DATA_DIR}/${metabolite51}
