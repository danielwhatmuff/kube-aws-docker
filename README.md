# kube-aws tool for building a Kubernetes cluster on AWS

# Summary

- A Docker build for the kube-aws command line tool, used to build Kubernetes on AWS. For more info, see [Kubernetes on AWS](https://github.com/coreos/coreos-kubernetes/tree/master/multi-node/aws)
- This image is built from the Alpine Linux base image and is just 23MB in size.

```
kube-aws     latest              57d71b91722f        About a minute ago   23.15 MB
```

[![](https://badge.imagelayers.io/danielwhatmuff/kube-aws-docker:latest.svg)](https://imagelayers.io/?images=danielwhatmuff/kube-aws-docker:latest 'Inspect Docker images at imagelayers.io')

# Requirements

- Docker :whale: - if you are on Mac, checkout the [Docker Toolbox](http://docs.docker.com/mac/step_one/)
- An AWS account and API credentials - [AWS](https://aws.amazon.com/)

# To build the Docker image and provision a cluster

- Create a local cluster.yaml config file - for help, see the [Kube AWS Cluster Config](https://coreos.com/kubernetes/docs/latest/kubernetes-on-aws.html#kube-aws-cluster-config) 
- Build the image using docker
```bash
$ docker build -t kube-aws .
```
- Run the kube-aws container to provision a cluster
```bash
$ docker run -v $(pwd):/root/ -e AWS_ACCESS_KEY_ID='foo' -e AWS_SECRET_ACCESS_KEY='bar' -e AWS_DEFAULT_REGION='eu-west-1' --rm kube-aws kube-aws up
```
- A kubectl config file will then be written to ./clusters/<cluster-name>/kubeconfig, which can be used to interact with your Kubernetes cluster like so:
```bash
$ kubectl --kubeconfig=clusters/<cluster-name>/kubeconfig get nodes
```
- To destroy the cluster, run:
```bash
$ docker run -v $(pwd):/root/ -e AWS_ACCESS_KEY_ID='foo' -e AWS_SECRET_ACCESS_KEY='bar' -e AWS_DEFAULT_REGION='eu-west-1' --rm kube-aws kube-aws destroy <cluster-name>
```

# Alternatively, you can use the Docker Hub automated build

```bash
$ docker pull danielwhatmuff/kube-aws-docker
```

### Contributing
File issues in GitHub to report bugs or issue a pull request to contribute.
