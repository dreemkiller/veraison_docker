FROM golang:1.18

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends \
        -y \
        wget \
        make \
        golang-goprotobuf-dev \
        build-essential \
        git \
        curl \
	unzip \
	xxd

RUN curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v21.7/protoc-21.7-linux-aarch_64.zip && \
	unzip -o protoc-21.7-linux-aarch_64.zip -d /usr/local bin/protoc && \
	unzip -o protoc-21.7-linux-aarch_64.zip -d /usr/local 'include/*'

# install some stuff that veraison needs
RUN /usr/local/go/bin/go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.27.1
RUN /usr/local/go/bin/go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1
RUN /usr/local/go/bin/go install github.com/mitchellh/protoc-gen-go-json@latest
RUN /usr/local/go/bin/go install github.com/golang/mock/mockgen@v1.6.0
RUN /usr/local/go/bin/go install github.com/cweill/gotests/gotests@v1.6.0
RUN /usr/local/go/bin/go install github.com/fatih/gomodifytags@v1.16.0
RUN /usr/local/go/bin/go install github.com/josharian/impl@v1.1.0
RUN /usr/local/go/bin/go install github.com/haya14busa/goplay/cmd/goplay@v1.0.0
RUN /usr/local/go/bin/go install github.com/go-delve/delve/cmd/dlv@latest
RUN /usr/local/go/bin/go install honnef.co/go/tools/cmd/staticcheck@latest
RUN /usr/local/go/bin/go install github.com/ramya-rao-a/go-outline@v0.0.0-20210608161538-9736a4bde949
RUN /usr/local/go/bin/go install golang.org/x/tools/gopls@latest
RUN /usr/local/go/bin/go install github.com/veraison/corim/cocli@latest

ENV DEBIAN_FRONTEND=dialog



#EXPOSE 8000

