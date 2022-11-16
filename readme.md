# data and scripts

This repository contains the data and scripts to reproduce the results from Rzezniczak et al. (2022). Regulation at *Drosophila*’s Malic Enzyme highlights the complexity of transvection and its sensitivity to genetic background. In review.

Authors: Teresa Z. Rzezniczak, Mark T. Rzezniczak, Bruce H. Reed, Ian Dworkin, Thomas J.S. Merritt


## data
`transvection_rawdata.csv` raw data file used for the QG analysis (see details below and in associated script).

`transvection_rawdata_other.csv`  largely the same as above but with additional variables not used in the QG analysis (so here for posteriority).

`pheno_men76.txt` contains the conditional means for MEN activity for each DGRP line in the Men76 dataset. Generated from the mixed model analysis described below.

`pheno_men86.txt` contains the conditional means for MEN activity for each DGRP line in the Men86 dataset. Generated from the mixed model analysis described below.

`covar_mengwas.txt` contains covariates for both the Men76 and Men86 datasets and was used in the GWAS for both datasets:
-  In this file, missing data points are represented by “-9”
- Wolbachia – Wolbachia presence/absence is indicated using 1 and 2, respectively.  
- MEN_SNP1 indicates which Men nonsynonymous SNP at position is present in each DGRP line
- MEN_SNP2 indicated which Men nonsynonymous SNP at position is present in each DGRP line
- MenEx3 is the conditional mean of each DGRP line when crossed to MenEx3 line
- Inversion PC1-Inversion PC5: The top 5 principal components when PCA analysis was run using annotated inversions in the DGRP
- EigVal1-Eigval5 – The top 5 principal components for PCA analysis of population structure


## analysis

### GWAS

GWAS analysis was done in plink (see manuscript). Plink code can be found in the file `PLINK_script.md` in the scripts folder.

`script_qqman.R` contains the scripts used to create the Manhattan plot and QQ plots in the paper.

### Quantitative Genetic analyses

All other information on the Quantitative Genetic analysis is in the `TransvectionQG_ID.Rmd` script. All QG analysis stems from the dataset in `../data/transvection_rawdata.csv`

ID made a small edit to the raw data, removing "NA" so it can be added in more easily in R.

## Misc folder

Contains intermediate files for plotting and GWAS (see `TransvectionQG_ID.Rmd`):

- `MenEx_DGRP_conditionalMeans.csv` (conditional means/BLUPs from mixed model analysis)
- `Men_76_ratio_post.csv` (posterior mean and 95% Credible intervals for "ratio plots")
- `Men_86_ratio_post.csv` (posterior mean and 95% Credible intervals for "ratio plots")

- `AssortedValuesForPaperFromID.xlsx` (exactly what it sounds like).

## outputs

All QG figures can be generated from R scripts.

**note these two files had to be removed from the github repo as they were too big**. They can be regenerated using PLINK.

`mengwas76.assoc.linear` PLINK GWAS output for Men76

`mengwas86.assoc.linear` PLINK GWAS output for Men86
