### This logbook records the main two-sample MR process ###

mkdir result
sh run-MR.sh
cat ./result/*/*MR.result.txt > all.merge.MR.result.txt

perl change.pl all.merge.MR.result.txt > changed.all.merge.MR.result.txt
perl /home/zxwang/Project/source/14NG/hash.pl IVW.significant.list > IVW.significant.annotated
