#!/bin/bash

FILE="/home/yyan/crontab_monitor"
FILE_TO_MONITOR="/etc/crontab"

MD5=$(sudo md5sum $FILE_TO_MONITOR)

if [ ! -f $FILE ]
then
	echo "$MD5" > $FILE
	exit 0;
fi;

if [ "$MD5" != "$(sudo cat $FILE)" ]
then
	echo "$MD5" > $FILE
	echo "$FILE_TO_MONITOR has been changed! 0_0! Be careful." | mail -s "$FILE_TO_MONITOR was changed!" root
fi;

