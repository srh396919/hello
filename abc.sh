#!/bin/bash/
echo "process management"
echo "top cpu consuming process are"
echo "PID CPU-LOAD PNAM"
ps aux |sort -nrk 3|head|awk '{ print $2" "$3" "$11 }' > psout
cat psout
read -p "enter threshold level:" th
while IFS= read line
do
  pno=$(echo $line |awk '{ print $1 }')
  cpuload=$(echo $line |awk '{ print $2 }')
  if (( $(echo "$cpuload > $th" |bc -l)))
  then 
  kill $pno
  fi
  done < "psout"
