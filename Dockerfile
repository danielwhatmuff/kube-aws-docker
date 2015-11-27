FROM ubuntu:14.04

MAINTAINER "Daniel Whatmuff" <danielwhatmuff@gmail.com>

WORKDIR /root/

ENV KUBE_AWS_VERSION 0.2.0

RUN apt-get install curl bash -y && \
            mkdir -p /root/.aws

RUN curl -L https://github.com/coreos/coreos-kubernetes/releases/download/v${KUBE_AWS_VERSION}/kube-aws-linux-amd64.tar.gz -o /tmp/kube-aws-linux-amd64.tar.gz && \
     tar -zxvf /tmp/kube-aws-linux-amd64.tar.gz -C /usr/local/bin/  && \
     rm -f /tmp/kube-aws-linux-amd64.tar.gz

ADD credentials /root/.aws/credentials
ADD cluster.yaml /root/cluster.yaml

CMD ["kube-aws"]
