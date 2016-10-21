FROM gliderlabs/alpine:3.4

RUN adduser -h /home/kube-aws -D kube-aws
WORKDIR /home/kube-aws/

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

USER kube-aws

CMD ["kube-aws"]
