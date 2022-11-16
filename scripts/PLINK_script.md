# PLINK code



## plink code – filtering out lines that weren’t used

```bash
{
   --bfile dgrp2

  --make-bed

  --out dgrp_filtered

  --remove incl_dgrplines_remove.txt
}
```




## plink code – pruning (1)
```bash
{
    --bfile dgrp_filtered

  --indep-pairwise 50 5 0.5

  --maf 0.02

  --out dgrp2prune
}
```

## plink code – pruning (2)
```bash
{
  --bfile dgrp_filtered

  --extract dgrp2prune.prune.in

  --make-bed

  --out dgrp_pca
}
```




## SMARTPCA:

parameter file: study.pca.par


```bash
{
   ## THE INPUT PARAMETERS

   ## PARAMETER NAME: VALUE
   genotypename: dgrp_pca.bed

   snpname: dgrp_pca.pedsnp

   indivname: dgrp_pca.pedind

   evecoutname: study.pca.evec

   evaloutname: study.eval

   altnormstyle: NO

   numoutevec: 10

   numoutlieriter: 0

   numoutlierevec: 10

   outliersigmathresh: 6

   qtmode: 0

}
```


### smartpca version: 13050

norm used


## plink code – GWAS – Men76

```bash
{
 --bfile dgrp_filtered

  --covar covar_mengwas.txt

  --linear hide-covar

  --maf 0.02

  --out mengwas76_Apr2022

  --pheno pheno_men76.txt
}
```



## Plink code – GWAS – Men86
```bash
{
  --bfile dgrp_filtered

  --covar covar_mengwas.txt

  --linear hide-covar

  --maf 0.02

  --out mengwas86_Apr2022

  --pheno pheno_men86.txt
}
```
