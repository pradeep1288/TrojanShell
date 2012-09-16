#!/bin/sh
#############################################################################
#Script to backup all the databases on the local MySQL server               #
#############################################################################

DAY="$(/bin/date +%Y-%m-%d)"
BACKUP_STORE="/var/www/backup"

mkdir -p $BACKUP_STORE/$DAY
/usr/local/mysql/bin/mysqldump --add-drop-table -u password -p"password" --all-databases > $BACKUP_STORE/$DAY/all_databases.sql 2> /dev/null
if [ $? == 0 ]; then
    echo "Backup has been successfully created at $BACKUP_STORE/$DAY/all_databases.sql"
else 
    echo "Failed to create the backup. MySQL server is probably not running"
fi
