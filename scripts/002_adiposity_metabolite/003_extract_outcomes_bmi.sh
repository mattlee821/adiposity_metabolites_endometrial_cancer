#!/bin/bash

#SBATCH --job-name=MR-analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-10:0:00
#SBATCH --mem=1000M

export WORK_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/female/bmi/

cd $WORK_DIR

# make phenotype column
tmp=$(mktemp) || { ret="$?"; printf 'Failed to create temp file\n'; exit "$ret"; }
for file in *.txt; do
    awk 'BEGIN{OFS="\t"} {print $0, (FNR>1 ? FILENAME : FILENAME)}' "$file" > "$tmp" &&
    mv -- "$tmp" "$file" || exit
done

# move phenotype column to start column
ls *.txt | while read f; do awk '{$1=$NF OFS $1;$NF=""}1' ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/female/bmi/${f}_final.txt; done;
rm /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/female/bmi/*_instruments.txt

# combine data and add header
head -1 /user/work/ml16847/001_projects/UKB_NMR_GWAS/instruments_female/Acetate_int_imputed.txt_snps.txt_instruments.txt > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/female/header # get header
for i in /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/female/bmi/*.txt; do cat $i >> /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi_instruments_metabolites_female.txt; done
cat /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi_instruments_metabolites_female.txt >> /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/header # append data onto header file

# get columns of interest
cat /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/header | awk '{ print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15 }' > /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/metabolite_outcome_bmi_female.txt
rm /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/header /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi_instruments_metabolites_female.txt


export WORK_DIR=/user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/combined/bmi/

cd $WORK_DIR

# make phenotype column
tmp=$(mktemp) || { ret="$?"; printf 'Failed to create temp file\n'; exit "$ret"; }
for file in *.txt; do
    awk 'BEGIN{OFS="\t"} {print $0, (FNR>1 ? FILENAME : FILENAME)}' "$file" > "$tmp" &&
    mv -- "$tmp" "$file" || exit
done

# move phenotype column to start column
ls *.txt | while read f; do awk '{$1=$NF OFS $1;$NF=""}1' ${f} > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/combined/bmi/${f}_final.txt; done;
rm /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/combined/bmi/*_instruments.txt

# combine data and add header
head -1 /user/work/ml16847/001_projects/UKB_NMR_GWAS/instruments_combined/Acetate_int_imputed.txt_snps.txt_instruments.txt > /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/combined/header # get header
for i in /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/combined/bmi/*.txt; do cat $i >> /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi_instruments_metabolites_combined.txt; done
cat /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi_instruments_metabolites_combined.txt >> /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/header # append data onto header file

# get columns of interest
cat /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/header | awk '{ print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15 }' > /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/metabolite_outcome_bmi_combined.txt
rm /user/work/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/header /newhome/ml16847/001_projects/adiposity_metabolites_endometrial_cancer/data/adiposity_metabolites_outcomes/bmi_instruments_metabolites_combined.txt
