Pheno=$1

mkdir /home/usrname/result/new.${Pheno}

Rscript  MR_analysis.R /home/usrname/${Pheno}.exposure.txt  HF.outcome.txt  ${Pheno}.MR.result.txt  ${Pheno}.heterogeneity.txt  ${Pheno}.pleiotropy.txt  ${Pheno}.singlesnp.txt  Scatter_plot.${Pheno}.pdf  Forest_plot.${Pheno}.pdf  leave-one-out.${Pheno}.pdf

mv *${Pheno}*  /home/usrname/result/new.${Pheno}
