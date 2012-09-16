#/bin/sh

###################################################################################
#A script to check if the host usc.edu is alive and send report to ttrojan@usc.edu#
###################################################################################

HOST="usc.edu"
COUNT=1

SUCCESS="Ping Successful"
FAILED="Ping Failed"
EMAILID="ttrojan@usc.edu"
count=$(ping -c $COUNT $HOST | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')

if [ $count -eq 0 ]; then
    echo "$HOST is down" | mail -s "$FAILED" $EMAILID
    echo "\n$FAILED. Mail Sent to $EMAILID."
else
    echo "$HOST is up" | mail -s "$SUCCESS" $EMAILID
    echo "\n$SUCCESS. Mail Sent to $EMAILID."
fi
