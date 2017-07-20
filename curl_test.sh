#!/usr/bin/env bash

log='client_curl.log'

#this take 2 argument
# instance number of bimax
# and domain

now=`date +%H_%M`
curl https://${2}/pw$1/index.php > pw${1}_${now}.html

line=`cat pw${1}_${now}.html | wc -l`

if [ $line -lt 260 ]; then
	echo "[${now}] pw${1}  $line respond" >> $log
	exit 1
fi
rm -f pw${1}_${now}.html
exit 0
 

