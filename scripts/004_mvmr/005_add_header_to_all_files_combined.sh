#!/bin/bash

#SBATCH --job-name=extract-instruments-combined
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=100000M

export ADIPOSITY_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS
export METABOLITE_DIR=/user/work/ml16847/UKB_NMR_GWAS/nmr_dat_all

# bmi instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments/bmi
head -1 ${ADIPOSITY_DIR}/bmi.giant-ukbb.meta-analysis.combined.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# whr instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments/whr
head -1 ${ADIPOSITY_DIR}/whr.giant-ukbb.meta-analysis.combined.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# whradjbmi instruments 
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/adiposity_instruments/whradjbmi
head -1 ${ADIPOSITY_DIR}/whradjbmi.giant-ukbb.meta-analysis.combined.23May2018.txt > ${DATA_DIR}/header
sed -i "1s/^/$(head -n1 ${DATA_DIR}/header)\n/" ${DATA_DIR}/*.txt
rm ${DATA_DIR}/header

# metabolite headers
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

# header
export HEADER=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/metabolite_instruments/header
head -1 ${METABOLITE_DIR}/${metabolite1a} > ${HEADER}/${metabolite1}
head -1 ${METABOLITE_DIR}/${metabolite2a} > ${HEADER}/${metabolite2}
head -1 ${METABOLITE_DIR}/${metabolite3a} > ${HEADER}/${metabolite3}
head -1 ${METABOLITE_DIR}/${metabolite4a} > ${HEADER}/${metabolite4}
head -1 ${METABOLITE_DIR}/${metabolite5a} > ${HEADER}/${metabolite5}
head -1 ${METABOLITE_DIR}/${metabolite6a} > ${HEADER}/${metabolite6}
head -1 ${METABOLITE_DIR}/${metabolite7a} > ${HEADER}/${metabolite7}
head -1 ${METABOLITE_DIR}/${metabolite8a} > ${HEADER}/${metabolite8}
head -1 ${METABOLITE_DIR}/${metabolite9a} > ${HEADER}/${metabolite9}
head -1 ${METABOLITE_DIR}/${metabolite10a} > ${HEADER}/${metabolite10}
head -1 ${METABOLITE_DIR}/${metabolite11a} > ${HEADER}/${metabolite11}
head -1 ${METABOLITE_DIR}/${metabolite12a} > ${HEADER}/${metabolite12}
head -1 ${METABOLITE_DIR}/${metabolite13a} > ${HEADER}/${metabolite13}
head -1 ${METABOLITE_DIR}/${metabolite14a} > ${HEADER}/${metabolite14}
head -1 ${METABOLITE_DIR}/${metabolite15a} > ${HEADER}/${metabolite15}
head -1 ${METABOLITE_DIR}/${metabolite16a} > ${HEADER}/${metabolite16}
head -1 ${METABOLITE_DIR}/${metabolite17a} > ${HEADER}/${metabolite17}
head -1 ${METABOLITE_DIR}/${metabolite18a} > ${HEADER}/${metabolite18}
head -1 ${METABOLITE_DIR}/${metabolite19a} > ${HEADER}/${metabolite19}

# bmi
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/metabolite_instruments/bmi
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

# whr
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/metabolite_instruments/whr
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

# whradjbmi
export DATA_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/analysis/004_mvmr/combined/metabolite_instruments/whradjbmi
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
