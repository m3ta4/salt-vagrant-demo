#!/bin/bash

FileBeatBin='/usr/bin/filebeat'
FileBeatConfDir='/etc/filebeat'
FileBeatVer='1.2.3'

# Install Filebeat
if [ ! -f "$FileBeatBin" ]; then
echo Installing FileBeat...
cd /usr/src && \
curl -L -O https://download.elastic.co/beats/filebeat/filebeat_"$FileBeatVer"_amd64.deb

dpkg -i filebeat_"$FileBeatVer"_amd64.deb
fi

