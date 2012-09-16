#/bin/sh

###################################################################################
#A script to check if the host usc.edu is alive and send report to ttrojan@usc.edu#
###################################################################################

HOST="usc.edu"
COUNT=1

SUBJECT="Ping failed"
EMAILID="ttrojan@usc.edu"
count=$(ping -c $COUNT $HOST | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')

if [ $count -eq 0 ]; then
    echo "$HOST is down" | mail -s "$SUBJECT" $EMAILID
    echo "\nMail Sent to $EMAILID. Down"
else
    echo "$HOST is up" | mail -s "$SUBJECT" $EMAILID
    echo "\nMail Sent to $EMAILID. Up"
fi
