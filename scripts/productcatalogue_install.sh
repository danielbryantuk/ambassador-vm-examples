#!/bin/bash -xe

apt-get update -y
apt-get upgrade ca-certificates-java -y
apt-get install openjdk-8-jre-headless -y

cd /tmp
wget https://storage.googleapis.com/oreilly-docker-java-shopping/productcatalogue-0.0.1-SNAPSHOT.jar -c -O app.jar
wget https://storage.googleapis.com/oreilly-docker-java-shopping/shopfront-0.0.1-SNAPSHOT.jar -c -O app-config.yml

apt-get install supervisor -y

cat >> /etc/supervisor/supervisord.conf <<EOL
[program:executablejar]
command=java -jar /tmp/app.jar server /tmp/app-config.yml
directory=/tmp
autostart=true
autorestart=true
stderr_logfile=/var/log/executablejar.err.log
stdout_logfile=/var/log/executablejar.out.log
EOL

service supervisor restart
