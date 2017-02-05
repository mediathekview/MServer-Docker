#!/bin/bash

# Link and copy configuration files
echo "starting..."
/mserver/MServer.sh 

echo "results:"
ls -l /mserver/filmlisten/

echo "copy reuslts..."
aws s3 cp /mserver/filmlisten/ s3://$MV_BUCKET_NAME --region eu-central-1 --recursive

echo "--------- FINISH ---------"

