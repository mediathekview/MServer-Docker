FROM ubuntu

RUN apt-get update && \
    apt-get -y install curl unzip software-properties-common && cd /tmp && \
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

ENV LANG en_GB.UTF-8
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

# MServer Env vars
ENV BRANCH="master"
ENV MLIB_BRANCH="master"
ENV BIN_PATH="/mserver"
ENV CONFIGS_FOLDER_PATH="/conf"
ENV RESULTS_FOLDER_PATH="/res"

WORKDIR /

COPY run.sh /run.sh
CMD /run.sh
