#!/bin/bash

## script name; mysql_script_runner.sh
## wrapper script to execute mysql script with variables

ARGS=3

if [ $# -ne "$ARGS" ]
then 

 echo "you passed $# parameters"
 echo "Usage: `basename $0` sql_script_file start_date end_date output_file"

exit 
fi 
sql_script=$1 
start_date=$2 
end_date=$3  

#run mysql script with paramenters: "gojek.sql" "start date" "end date" i.e   sh gojek.sh gojek.sql 2015-10-01 2015-10-12

/usr/bin/mysql -h "localhost" -u "root" "-proot" "gojek" -e "set @start_date='$start_date'; set @end_date='$end_date'; source $sql_script;" > out.csv

#

python gojek.py

exit

# end of script.
