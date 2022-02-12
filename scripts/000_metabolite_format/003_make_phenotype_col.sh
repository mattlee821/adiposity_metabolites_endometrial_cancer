cd /user/work/ml16847/UKB_NMR_GWAS/instruments/female
# make phenotype column
tmp=$(mktemp) || { ret="$?"; printf 'Failed to create temp file\n'; exit "$ret"; }
for file in *.txt; do
    awk 'BEGIN{OFS="\t"} {print $0, (FNR>1 ? FILENAME : "phenotype")}' "$file" > "$tmp" &&
    mv -- "$tmp" "$file" || exit
done

# move phenotype column to start column
ls *.txt | while read f; do awk '{$1=$NF OFS $1;$NF=""}1' ${f} > /user/work/ml16847/UKB_NMR_GWAS/instruments/female/${f}_instruments.txt; done;
rm *.txt_snps.txt

# combine data and add header
head -1 /user/work/ml16847/UKB_NMR_GWAS/instruments/female/Acetate_int_imputed.txt_snps.txt_instruments.txt > /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female # get header
tail -n +2 -q /user/work/ml16847/UKB_NMR_GWAS/instruments/female/*.txt >> /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female.txt # combine all files without header
cat /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female.txt >> /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female # append data onto header file
rm /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female.txt

cat /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female | awk '{ print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15 }' > /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female.txt
rm /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_female



cd /user/work/ml16847/UKB_NMR_GWAS/instruments/all
# make phenotype column
tmp=$(mktemp) || { ret="$?"; printf 'Failed to create temp file\n'; exit "$ret"; }
for file in *.txt; do
    awk 'BEGIN{OFS="\t"} {print $0, (FNR>1 ? FILENAME : "phenotype")}' "$file" > "$tmp" &&
    mv -- "$tmp" "$file" || exit
done

# move phenotype column to start column
ls *.txt | while read f; do awk '{$1=$NF OFS $1;$NF=""}1' ${f} > /user/work/ml16847/UKB_NMR_GWAS/instruments/all/${f}_instruments.txt; done;
rm *.txt_snps.txt

# combine data and add header
head -1 /user/work/ml16847/UKB_NMR_GWAS/instruments/all/Acetate_int.imputed.txt_snps.txt_instruments.txt > /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all # get header
tail -n +2 -q /user/work/ml16847/UKB_NMR_GWAS/instruments/all/*.txt >> /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all.txt # combine all files without header
cat /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all.txt >> /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all # append data onto header file
rm /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all.txt

cat /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all | awk '{ print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15 }' > /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all.txt
rm /user/work/ml16847/UKB_NMR_GWAS/instruments/exposure_data_all


