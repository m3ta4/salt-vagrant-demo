#!/bin/bash

FileBeatBin='/usr/bin/nginx'
FileBeatConfDir='/etc/nginx'
FileBeatVer='1.2.3'

# Install Filebeat
if [ ! -f "$FileBeatBin" ]; then
echo Installing FileBeat...
cd /usr/src && \
curl -L -O https://download.elastic.co/beats/nginx/nginx_"$FileBeatVer"_amd64.deb

dpkg -i nginx_"$FileBeatVer"_amd64.deb
fi

