FROM zot24/glibc

MAINTAINER Sergey Zhukov, sergey@jetbrains.com

ENV FILEBEAT_VERSION=1.3.0 \
    FILEBEAT_SHA1=6f6d5363bd343f026bdf4aa2a87c86dbbbe76e29

RUN wget http://download.elastic.co/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.tar.gz -O /filebeat.tar.gz && \
    echo "${FILEBEAT_SHA1}  filebeat.tar.gz" | sha1sum -c - && \
    tar xzvf /filebeat.tar.gz && \
    cd filebeat-* && \
    mv filebeat /bin && \
    mv filebeat.yml / && \
    cd / && \
    rm -rf filebeat-*

ADD run-services.sh /
RUN chmod a+x /run-services.sh

CMD /run-services.sh
