#!/bin/bash

#SBATCH --job-name=extract_metab_instruments
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=100M

#loop through files in linux to extract GWAS significant SNPs
cd /user/work/ml16847/UKB_NMR_GWAS/nmr_dat_female/
ls *.txt | while read f; do awk -F"\t" 'NR==1{print;next}$14<5e-08' ${f} > /user/work/ml16847/UKB_NMR_GWAS/instruments/female/${f}_snps.txt; done;

cd /user/work/ml16847/UKB_NMR_GWAS/nmr_dat_all/
ls ${ALL}*.txt | while read f; do awk -F"\t" 'NR==1{print;next}$14<5e-08' ${f} > /user/work/ml16847/UKB_NMR_GWAS/instruments/all/${f}_snps.txt; done;


