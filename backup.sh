#!/bin/sh

set -e

DATE=`date -I`
FILENAME="backup-$DATE.sql"
export PGPASSWORD=${DATABASE_PASSWORD}

pg_dump -h ${DATABASE_HOST} -U ${DATABASE_USER} -d ${DATABASE_NAME} > ${FILENAME}
gzip ${FILENAME}

aws s3 cp ${FILENAME}.gz s3://${BUCKET_NAME}
