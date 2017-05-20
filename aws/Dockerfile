FROM mediathekview/mserver-docker:latest

RUN apt-get update && apt-get install python -y && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && rm -rf awscli-bundle


# Mount S3 Bucket
COPY config_clone.sh /config_clone.sh
ENTRYPOINT "/config_clone.sh"

WORKDIR /

CMD /run.sh

