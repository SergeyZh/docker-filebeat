# docker-filebeat
Filebeat from Elastic

# Overview

Docker container for running Filebeat

# Customizing filebeat configuration

You can prepare your custom version of filebeat.yml and mount it inside docker container as shown below.
You can define any number of environment variables like `FILEBEAT_<NAME>` and use them inside your custom filebeat.yml

```
docker run -it --rm -v `pwd`/filebeat.yml:/filebeat.yml -e FILEBEAT_HOST=logstash.test.com -e FILEBEAT_PORT=5001 -e FILEBEAT_INDEX=logstash -e FILEBEAT_SHIPPER_NAME=`hostname` SergeyZh/filebeat:1.3.0
```

