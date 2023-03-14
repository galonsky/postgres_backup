#!/bin/bash

set -e

DATE=`date --iso`
FILENAME="backup-$DATE.sql"
export PGPASSWORD=${DATABASE_PASSWORD}

pg_dump -h ${DATABASE_HOST} -U ${DATABASE_USER} > ${FILENAME}
gzip ${FILENAME}

aws s3 cp ${FILENAME}.gz s3://${BUCKET_NAME}
