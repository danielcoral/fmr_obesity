#!/bin/bash

mapfile -t myarray < <(ls /ludc/Active_Projects/Discordant_variant_analysis/Private/bmi_t2d_ukbb/snps | cat | awk '{gsub("grs_chr|.txt",""); print}')

for chr in "${myarray[@]}";do /ludc/Tools/Software/Plink/v2.00a1LM/plink2 --memory 8000 --bgen /ludc/Raw_Data_Archive/UKBB/imp/ukb_imp_chr${chr}_v3.bgen --sample /ludc/Active_Projects/UKBB_18274/Private/ukb18274_imp_chr1_v3_s487314.sample --extract /ludc/Active_Projects/Discordant_variant_analysis/Private/bmi_t2d_ukbb/snps/grs_chr${chr}.txt --make-pgen --out /ludc/Active_Projects/Discordant_variant_analysis/Private/bmi_t2d_ukbb/ukb_genotype/snpcount_chr$chr; done


