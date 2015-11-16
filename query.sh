#!/bin/bash

while read sql <&0; do
echo $sql
if [[ -z $sql ]] ; then
    echo "SQL string is empty"
    exit 2
fi
done
sql="sql=$sql"
curl --data-urlencode "$sql"  'https://metrics.pro.com/api/v1/query?key=Z7ovgDCyPRtjdz0QMEpm' |  grep -v '^[(][0-9]* rows[)]$$' | python ../tsv2csv.py | dos2unix | tail -n +2 
