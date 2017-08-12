#!/usr/bin/env bash

log=/root/bimax_client_test/client_curl.log

#this take 2 argument
# instance number of bimax
# and domain

now=`date +%Y_%m_%d_%H_%M`
archive=/root/bimax_client_test/pw${1}_${now}.html
curl https://${2}/pw$1/index.php > $archive

line=`cat $archive | wc -l`

if [ $line -lt 260 ]; then
	echo "[${now}] pw${1}  $line respond" >> $log
	exit 1
fi
rm -f $archive
exit 0
 

