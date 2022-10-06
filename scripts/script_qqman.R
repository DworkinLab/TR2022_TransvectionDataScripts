
library(dplyr)
install_github("stephenturner/qqman", ref = "dev")
library(qqman)

# THis assumes you start in the scripts directly. Check with getwd()
setwd("../outputs/")

#read in ".qassoc" file from plink
mengwas<- read.table("men76.assoc.linear", header=T)

#eliminate rows with "NA" from dataset
mengwas <- mengwas[complete.cases(mengwas[ ,c("BETA", "P")]), ]

#sort by most significant SNPS
mengwas <- arrange(mengwas, P)

#generate qq-plot for autosomes
mengwas_autosomes<- filter(mengwas, CHR != "5")

tiff("men86_qq_autosomes.tiff", width = 9, height = 9, units = 'in', res = 300, compression = 'none')
mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 4, 0, 0))
qq(mengwas_autosomes$P, cex = 2.0, cex.axis = 2.0, cex.lab = 2.0, las=1, mgp=c(4.5, 1, 0))
dev.off()

#generate qq-plot for X chromsome
mengwas_X<- filter(mengwas, CHR == "5")

tiff("men76_qq_X.tiff", width = 9, height = 9, units = 'in', res = 300, compression = 'none')
mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 4, 0, 0))
qq(mengwas_X$P, cex = 2.0, cex.axis = 2.0, cex.lab = 2.0, las=1, mgp=c(4.5, 1, 0))
dev.off()

#generate manhattan plot
mengwas_man <- select(mengwas, SNP, CHR, BP, P)

tiff("Mengwas76_man.tiff", width = 14, height = 10, units = 'in', res = 300, compression = 'none')
mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 4, 0, 0))
manhattan(mengwas_man, chrlabs = c("2L", "2R", "3L", "3R", "X", "4"), suggestiveline = -log10(1.8001e-8),
          genomewideline = -log10(1e-4), col = c("black", "orange3"), cex = 2.0, cex.lab = 2.0, cex.axis = 2.0)
dev.off()

#select SNPs with P < 5e-4
mengwas_sig <- filter(mengwas, P <= 5e-4)

#export significant data to tab-delimited file
#write.table(mengwas_sig, "c:/Users/tzez/Desktop/Analysis/men76_sig.txt", sep="\t", 
#            col.names = FALSE, row.names = FALSE, quote = FALSE)




