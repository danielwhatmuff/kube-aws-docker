# kube-aws CLI for building Kubernetes on AWS

# Summary

- A Docker build for the kube-aws command line tool, used to build Kubernetes on AWS. For more info, see [Kubernetes on AWS](https://github.com/coreos/coreos-kubernetes/tree/master/multi-node/aws)
- This image is built from the Alpine Linux base image and is just 23MB in size.

```
kube-aws     latest              57d71b91722f        About a minute ago   23.15 MB
```

# Requirements

- Docker :whale: - if you are on Mac, checkout the [Docker Toolbox](http://docs.docker.com/mac/step_one/)
- An AWS account and API credentials - [AWS](https://aws.amazon.com/)

# Usage

- Add AWS credentials to the example-credentials file and rename to credentials - for help, see the [AWS CLI Guide](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-file)
```bash
[default]
aws_access_key_id=###
aws_secret_access_key=###
region=###
```
- Create a local cluster.yaml config file - for help, see the [Kube AWS Cluster Config](https://coreos.com/kubernetes/docs/latest/kubernetes-on-aws.html#kube-aws-cluster-config) 
- Build the image using docker
```bash
$ docker build -t kube-aws .
```
- Use the AWS CLI
```bash
$ docker run --rm aws-cli kube-aws up
```

# NOTE

**Please be careful not to push your AWS credentials to Github! :scream:**

### Contributing
File issues in GitHub to report bugs or issue a pull request to contribute.
