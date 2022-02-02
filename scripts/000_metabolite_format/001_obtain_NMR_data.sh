# obtain NMR GWAS data

# data location
cd /projects/MRC-IEU/research/projects/ieu2/p6/119/working/data/

# copy data over to BC3 
rsync -avxz nmr_dat_female ml16847@bp1-login01b.acrc.bris.ac.uk:/user/work/ml16847/UKB_NMR_GWAS
rsync -avxz nmr_dat_all ml16847@bp1-login01b.acrc.bris.ac.uk:/user/work/ml16847/UKB_NMR_GWAS

# unzip data
cd /user/work/ml16847/UKB_NMR_GWAS

gzip -d *.txt.gz
