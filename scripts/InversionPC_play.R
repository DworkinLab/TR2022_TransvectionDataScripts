dir()


covariate_data <- read.csv("men86_covar.csv", h = T, na.strings = "-9")

head(covariate_data)
str(covariate_data)

sd_vars <- apply(covariate_data[, c(-1,-2)], 2, sd, na.rm = T)
sd_vars 


cor_out <- cor(covariate_data[,c(-1,-2)], 
               use = "pairwise.complete.obs")



cor(covariate_data[, c(17,18)], use = "complete.obs")


 apply(covariate_data[, c(-1,-2)], 2, table)
 
 
 names(covariate_data)
 
 
pc_out <- prcomp(covariate_data[,  8:17], scale. = FALSE)

 summary(pc_out)

 
# What you want is
 
 inversion_pcs <- pc_out$x[,1:5] # first five PCs
 
 head( inversion_pcs )
 
apply(inversion_pcs, 2, table)

cor(covariate_data[, 18:20],   use = "pairwise.complete.obs")


mod_MenEx3 <- lm(MenEx3 ~ MEN_SNP1  + MEN_SNP2 +  inversion_pcs[,1] + wolbachia + eigval1 + eigval2, data = covariate_data )

summary(mod_MenEx3)
 