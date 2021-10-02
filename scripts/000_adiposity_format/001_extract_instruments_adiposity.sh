###########################
#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=004:00:00

export WORK_DIR=/newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data

cd $WORK_DIR

#loop through files in linux to extract GWAS significant SNPs
ls *.txt | while read f; do awk -F" " 'NR==1{print;next}$9<5e-09' ${f} > /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/${f}_snps.txt; done;
