#!/bin/bash
VERSION=3.1.1

docker login

#Build default
cd default
docker build --build-arg VERSION=$VERSION -t mediathekview/mserver-docker:$VERSION -t mediathekview/mserver-docker:latest .
docker push mediathekview/mserver-docker:$VERSION
docker push mediathekview/mserver-docker:latest
cd ..

#Build development
cd development
docker build -t mediathekview/mserver-development-docker:latest .
docker push mediathekview/mserver-development-docker:latest
cd ..



#Build aws
cd aws
docker build -t mediathekview/mserver-aws-docker:$VERSION -t mediathekview/mserver-aws-docker:latest .
docker push mediathekview/mserver-aws-docker:$VERSION
docker push mediathekview/mserver-aws-docker:latest
cd ..
