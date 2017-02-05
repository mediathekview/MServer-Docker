#!/bin/bash

# Check that the environment variables has been set correctly
if [ -z "$CONFIG_BUCKET_NAME" ]; then
  echo >&2 'error: missing CONFIG_BUCKET_NAME environment variable'
  exit 1
fi

if [ -z "$MV_BUCKET_NAME" ]; then
  echo >&2 'error: missing MV_BUCKET_NAME environment variable'
  exit 1
fi


if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo >&2 'error: missing AWS_ACCESS_KEY_ID environment variable'
  exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo >&2 'error: missing AWS_SECRET_ACCESS_KEY environment variable'
  exit 1
fi

echo "Loading configs"
aws s3 cp s3://${CONFIG_BUCKET_NAME} /etc/mserver --region eu-central-1 --recursive
ln -s /etc/mserver ~/.mserver

echo "Configs:"
ls -l /etc/mserver
cp /etc/mserver/mserver.xml /mserver


echo "Start server:"
/start.sh
