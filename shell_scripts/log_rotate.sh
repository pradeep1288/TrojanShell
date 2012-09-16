#!/bin/sh
#########################################################################################
# A script to rotate log files present in /var/www/logs whose size are greater than 10MB#
#########################################################################################

DATE="$(/bin/date +%Y-%m-%d)"
LOGDIR="/var/www/logs"

find $LOGDIR -name '*.log' -type f -size +10M | while read logfile
do
    echo "Found $logfile"
    tmplogfile=$logfile.$DATE
    cp $logfile $tmplogfile
    cat /dev/null > $logfile
    gzip -f -9 $tmplogfile
    if [ $? == 0 ]; then
        echo "$tmplogfile.gz created at $LOGDIR"
    else
        echo "Something went wrong..."
    fi
done
