mkdir result
sh run-MR.sh
cat ./result/*/*MR.result.txt > all.merge.MR.result.txt

perl change_format.pl all.merge.MR.result.txt > changed.all.merge.MR.result.txt
perl select_IVW_significant.pl IVW.significant.list > IVW.significant.annotated
