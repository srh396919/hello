awk '{print}' employee.txt
awk '{print $2,$5}' employee.txt
awk '$5>6000' employee.txt
awk 'BEGIN{count=0}
$4~/Technology/{count++}
END {print "NO of employees",count}' employee.txt
awk 'BEGIN {printf "Serial_NO\tName\tDesignation\tDepartment\tSalary\n"}{print}' employee.txt
