# ID
print(format(Sys.time(),'%d %b %Y')) # Written originally on November 17th, 2022

# Little simulation to look at how many SNPs we would see in common from two GWAS assuming it was completely random 
# Sorry for hard coding everything. It was written rather quickly.


# this assumes no LD among sites, no correlations in the measures across the two GWAS...etc.
# This is about as simple a null as could be conceived, so may be missing some useful things to consider to address this question
# But it was asked after the second rounds of revisions.. One can only do so much, and it is not really a central questions. 
# Do with this what you will...



sharedSNPs <- function( totalSNPs = 2778429, sigSites1 = 237, sigSites2 = 538) {
  sites1 <- sample(totalSNPs, size = sigSites1, replace = F)
  sites2 <- sample(totalSNPs, size = sigSites2, replace = F)
  intersection_length <- length(intersect(sites1, sites2))
  return(intersection_length)
  #return(list(sites1, sites2))
}

sharedSNPs()

HowManySharedSites <- replicate(10^4, sharedSNPs())

max(HowManySharedSites) # the maximum number of shared sites among all the simulations

quantile(HowManySharedSites, 
         probs = c(0.5, 0.9, 0.95, 0.99))

mean(HowManySharedSites > 0) # what proportion of simulations have any sites in common.



# After LD pruning there were 1050279 sites

HowManySharedSites2 <- replicate(10^4, sharedSNPs(totalSNPs = 1050279))
max(HowManySharedSites2) # the maximum number of shared sites among all the simulations

quantile(HowManySharedSites2, 
         probs = c(0.5, 0.9, 0.95, 0.99))

mean(HowManySharedSites2 > 0) # what proportion of simulations have any in common.


# Only considering common genes
# This is probably a more sensible check.
# This uses the total gene number from:
# https://flybase.org/docs/releasenotes.tx
# https://www.ncbi.nlm.nih.gov/genome/47?genome_assembly_id=204923
#  Genome R6.48, with 17896 annotated gene models
# It looks like there are about 2689 genes on the X, (113 on Y) which were not included in the analysis to be consistent with the paper.
# So totalSNPs should represent all genes minus X & Y linked genes (15094)
# 163 unique genes from Men86, 313 for Men76


HowManySharedSites3 <- replicate(10^4, sharedSNPs(totalSNPs = 15094, sigSites1 = 163, sigSites2 = 313))

max(HowManySharedSites3) # the maximum number of shared sites among all the simulations

quantile(HowManySharedSites3, 
         probs = c(0.5, 0.9, 0.95, 0.99))


