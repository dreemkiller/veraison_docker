FROM ubuntu:20.04
ARG UID=0
ARG USER=root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
        wget \
        make \
        protobuf-compiler \
        golang-goprotobuf-dev \
        build-essential \
        git \
        curl

# add a user
RUN \
    mkdir -p /work; \
    if [ "$USER" != "root" ] ; then \
        useradd -u $UID -m -p `openssl rand -base64 32` -s /bin/bash $USER ; \
    fi

RUN wget https://go.dev/dl/go1.18.linux-amd64.tar.gz

RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.linux-amd64.tar.gz

USER $USER
RUN echo "PATH=$HOME/go/bin:$PATH:/usr/local/go/bin" >> $HOME/.bashrc

#RUN /usr/local/go/bin/go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

RUN /usr/local/go/bin/go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.26
RUN /usr/local/go/bin/go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
RUN /usr/local/go/bin/go install github.com/mitchellh/protoc-gen-go-json@latest
RUN /usr/local/go/bin/go install github.com/golang/mock/mockgen@v1.6.0

ENTRYPOINT ["tail", "-f", "/dev/null"]