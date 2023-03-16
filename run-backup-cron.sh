#!/bin/bash

echo "Backing up db"
cd /home/pi/postgres_backup
/usr/local/bin/docker-compose run -T --rm postgres-backup

