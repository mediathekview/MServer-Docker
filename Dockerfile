FROM ubuntu

RUN apt-get update && \
    apt-get -y install python curl unzip software-properties-common && cd /tmp && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
    rm awscli-bundle.zip && rm -rf awscli-bundle && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install git -y && \
    apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*


# Install Java.

RUN \

  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer

ENV JAVA_VERSION=8u112 \
    JAVA_VERSION_PREFIX=1.8.0_112


ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle/

ENV PATH $JAVA_HOME/bin:$PATH

# Mount S3 Bucket
COPY config_clone.sh /config_clone.sh
ENTRYPOINT "/config_clone.sh"

ENV LANG en_GB.UTF-8
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

# Build and get MServer
RUN git clone https://github.com/mediathekview/MServer.git /tmp/mserver && \
cd /tmp/mserver && \
echo "building..." && \
./gradlew clean build && \
echo "deleting old..." && \
rm -rf /mserver && \
echo "unziping..." && \
mkdir /mserver && \
unzip build/distributions/*.zip -d /mserver && \
echo "moving..." && \
find /mserver/MS*/* -exec mv -v {} "/mserver" \; || : 

WORKDIR /mserver

COPY start.sh /start.sh
