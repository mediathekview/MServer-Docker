#!/bin/bash

wget https://github.com/mediathekview/MServer/releases/download/$VERSION/MServer-$VERSION.zip -O mserver.zip
unzip mserver.zip

rm mserver.zip

mkdir $BIN_PATH
mv MServer-$VERSION/* $BIN_PATH
rm -rf MServer-$VERSION
