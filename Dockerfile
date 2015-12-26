FROM gliderlabs/alpine:3.2

RUN apk-install curl && \
    mkdir -p /root/.aws

MAINTAINER "Daniel Whatmuff" <danielwhatmuff@gmail.com>

WORKDIR /root/

ENV KUBE_AWS_VERSION 0.3.0

RUN curl -L https://github.com/coreos/coreos-kubernetes/releases/download/v${KUBE_AWS_VERSION}/kube-aws-linux-amd64.tar.gz -o /tmp/kube-aws-linux-amd64.tar.gz && \
     tar -zxvf /tmp/kube-aws-linux-amd64.tar.gz -C /usr/local/bin/  && \
     rm -f /tmp/kube-aws-linux-amd64.tar.gz && \
     kube-aws version

ADD cluster.yaml /root/cluster.yaml

CMD ["kube-aws"]
