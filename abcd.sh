#!/bin/bash
echo "PROCESS MANAGEMENT"
echo "TOP CPU CONSUMING PROCESSES ARE"
echo "pid cpu_load pname"
ps aux |sort -nrk 3|head|awk '{print $2""$3""$11}' > psout
cat psout
read -p "ENTER THRESHOLD VALUE" th
while IFS= read line
do
 pno=$(echo $line|awk '{print $1}')
 cpuloads=$(echo $line|awk '{print $2}')
 if(($(echo $cpuloads > $th | bc -l)))
 then
  kill $pno
  fi
 done <"psout"
