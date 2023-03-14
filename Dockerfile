FROM amazonlinux:2023

RUN yum -y install postgresql15 aws-cli gzip
ADD backup.sh /usr/local/bin/backup.sh

WORKDIR /tmp
USER nobody

ENTRYPOINT ["/usr/local/bin/backup.sh"]