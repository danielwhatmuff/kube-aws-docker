FROM gliderlabs/alpine:3.4

MAINTAINER "Daniel Whatmuff" <danielwhatmuff@gmail.com>

WORKDIR /root/

ENV KUBE_AWS_VERSION 0.8.3

RUN apk-install curl \
    && curl -L https://github.com/coreos/coreos-kubernetes/releases/download/v${KUBE_AWS_VERSION}/kube-aws-linux-amd64.tar.gz -o /tmp/kube-aws-linux-amd64.tar.gz \
    && tar -zxvf /tmp/kube-aws-linux-amd64.tar.gz linux-amd64/kube-aws \
    && mv linux-amd64/kube-aws /usr/local/bin/ \
    && chmod +x /usr/local/bin/kube-aws \
    && apk del curl \
    && rmdir linux-amd64/ \
    && rm -f /tmp/kube-aws-linux-amd64.tar.gz\
    && kube-aws version


CMD ["kube-aws"]
