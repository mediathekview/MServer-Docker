#!/bin/bash

#Build MLib
git clone https://github.com/mediathekview/MLib.git --branch $BRANCH --single-branch mlib

cd mlib
./gradlew clean build



#Build MServer
git clone https://github.com/mediathekview/MServer.git --branch $BRANCH --single-branch mserver

cd mserver
./gradlew clean build

mkdir $BIN_PATH
unzip build/distributions/*.zip -d $BIN_PATH

find $BIN_PATH/MS*/* -exec mv -v {} "$BIN_PATH" \; || : 

cd /

#Run MServer
if [ ! -f $CONFIGS_FOLDER_PATH ]; then
        mkdir $CONFIGS_FOLDER_PATH
fi

CONFIG_FILE=$CONFIGS_FOLDER_PATH/mserver.xml
UPLOAD_CONFIG_FILE=$CONFIGS_FOLDER_PATH/upload.xml

if [ ! -f $CONFIG_FILE ]; then
	cp $BIN_PATH/mserver.xml $CONFIG_FILE
fi

if [ ! -f $UPLOAD_CONFIG_FILE ]; then
        cp $BIN_PATH/upload.xml $UPLOAD_CONFIG_FILE
fi

rm $BIN_PATH/mserver.xml
rm $BIN_PATH/upload.xml

ln -s $CONFIG_FILE $BIN_PATH/mserver.xml 
ln -s $UPLOAD_CONFIG_FILE $BIN_PATH/upload.xml 

ln -s $RESULTS_FOLDER_PATH $BIN_PATH/filmlisten 


exec $BIN_PATH/MServer.sh
