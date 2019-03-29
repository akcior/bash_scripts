#!/bin/bash

IFS=

OUTPUT1=$(grep "OK DOWNLOAD"  cdlinux.ftp.log | cut -d '"' -f 2-4 | sort |  uniq | cut -d '"' -f3 | sed "s#.*/##" | sort | grep "\.iso")

OUTPUT2=$(grep -w "200" cdlinux.www.log | grep "GET" | cut -d " " -f1,7 | sort | uniq | cut -d " " -f2 | sed "s#.*/##" | grep "\.iso$" | cut -d "F" -f5)

echo $OUTPUT1$'\n'$OUTPUT2 | sort | uniq -c | sort -r
