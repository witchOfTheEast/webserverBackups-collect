#!/bin/bash

limit=98
email_to=serveradmin@amcit.org
partition=vda
self_hostname=$(hostname)
get_storage=$(df -h | grep $partition | awk '{ print $5 }' | cut -d'%' -f1)

if [[ $get_storage -gt $limit ]]; then
    echo "$self_hostname $vda is at $get_storage of usage. Action is needed." | mail -S "$self_hostname Out of disk space" $email_to
fi
