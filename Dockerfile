FROM alpine:latest

RUN apk add postgresql15 aws-cli gzip
RUN mkdir -p /usr/local/bin
ADD backup.sh /usr/local/bin/backup.sh

WORKDIR /tmp

ENTRYPOINT ["/usr/local/bin/backup.sh"]
