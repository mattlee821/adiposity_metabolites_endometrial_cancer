###########################
#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=100:00:00
#PBS -e log/
#PBS -o log/

export WORK_DIR=/newhome/ml16847/001_projects/UKB_NMR_GWAS/nmr_dat_female

cd $WORK_DIR

# loop through metabolite summary stats
ls *.txt | while read f; do grep -w -F -f /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS/bmi_snp_list.txt ${f} > /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi/${f}_adiposity_instruments.txt; done;

ls *.txt | while read f; do grep -w -F -f /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS/whr_snp_list.txt ${f} > /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/whr/${f}_adiposity_instruments.txt; done;

ls *.txt | while read f; do grep -w -F -f /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_GWAS/whradjbmi_snp_list.txt ${f} > /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/whradjbmi/${f}_adiposity_instruments.txt; done;
