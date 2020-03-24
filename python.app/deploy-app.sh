#!/bin/bash
set -e
#ip="$(curl icanhazip.com -s"
ip="127.0.0.1"
name="$1"
version="$2"
port="8000"
regestry="$ip:5000"

echo "Pulling $version from regestry..."
docker pull $regestry/$name:$version > /dev/null
docker tag -force $regestry/$name:$version $name:$version
echo "Stopping existing versions..."
docker rm -f $(docker ps | grep $name | cut -d ' ' -f 1) > /dev/null 2>&1 || true
echo " Starting version $version ..."
docker run -d -P --link redis:db $name:$version > /dev/null
echo "$name deployed:"
echo "    $(docker port 'docker ps -lq' $port | sed s/0.0.0.0/$ip/)"