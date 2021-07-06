library(TwoSampleMR)
library(ggplot2)

args<-commandArgs(T)

exposure_dat <- read_exposure_data(
filename = args[1],
sep = "\t",
snp_col = "SNP",  
beta_col = "Effect",  
se_col = "StdErr",         
effect_allele_col = "Allele1",
other_allele_col = "Allele2",
eaf_col = "Freq1",
pval_col = "P",
)

outcome_dat <- read_outcome_data(
 snps = exposure_dat$SNP,
 filename = args[2],
 sep = "\t",
 snp_col = "SNP",
 beta_col = "beta",
 se_col = "se",
 effect_allele_col = "reference_allele",
 other_allele_col = "other_allele",
 eaf_col = "ref_allele_frequency",
 pval_col = "pvalue",
)

dat <- harmonise_data(exposure_dat, outcome_dat)

res <- mr(dat)
het<-mr_heterogeneity(dat)
plt<-mr_pleiotropy_test(dat)
sin<-mr_singlesnp(dat)
youwant <- generate_odds_ratios(res)


write.table(youwant, file=args[3],sep= "\t", quote=F)
write.table(het, file=args[4],sep= "\t", quote=F)
write.table(plt, file=args[5],sep= "\t", quote=F)
write.table(sin, file=args[6],sep= "\t", quote=F)

p1 <- mr_scatter_plot(res, dat)
ggsave(p1[[1]], file=args[7], width=7, height=7)

res_single <- mr_singlesnp(dat, all_method=c("mr_ivw", "mr_egger_regression"))
p2 <- mr_forest_plot(res_single)
ggsave(p2[[1]], file=args[8], width=10, height=10)

res_loo <- mr_leaveoneout(dat)
p3 <- mr_leaveoneout_plot(res_loo)
ggsave(p3[[1]], file=args[9], width=10, height=10)
