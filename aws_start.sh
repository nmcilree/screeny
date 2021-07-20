#!/bin/sh
scho "Starting apache"
service apache2 start
echo "Adding cron"
cron && tail -f /var/log/cron.log

