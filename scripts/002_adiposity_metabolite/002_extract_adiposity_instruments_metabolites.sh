#!/bin/bash

#SBATCH --job-name=MR-analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=1000M

cd /user/work/ml16847/UKB_NMR_GWAS/nmr_dat_female/

# loop through metabolite summary stats
ls *.txt | while read f; do grep -w -F -f /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snp_list_female.txt ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi/${f}_adiposity_instruments_female.txt; done;

ls *.txt | while read f; do grep -w -F -f /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snp_list_female.txt ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/whr/${f}_adiposity_instruments_female.txt; done;

ls *.txt | while read f; do grep -w -F -f /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snp_list_female.txt ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/whradjbmi/${f}_adiposity_instruments_female.txt; done;


cd /user/work/ml16847/UKB_NMR_GWAS/nmr_dat_combined/

# loop through metabolite summary stats
ls *.txt | while read f; do grep -w -F -f /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity/bmi_snp_list_combined.txt ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi/${f}_adiposity_instruments_combined.txt; done;

ls *.txt | while read f; do grep -w -F -f /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity/whr_snp_list_combined.txt ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/whr/${f}_adiposity_instruments_combined.txt; done;

ls *.txt | while read f; do grep -w -F -f /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity/whradjbmi_snp_list_combined.txt ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/whradjbmi/${f}_adiposity_instruments_combined.txt; done;
