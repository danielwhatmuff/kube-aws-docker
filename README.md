# kube-aws tool for provisioning a CoreOS/Kubernetes cluster on AWS

# Summary

- A Docker build for the kube-aws command line tool, used to build Kubernetes on AWS. For more info, see [Kubernetes on AWS](https://github.com/coreos/coreos-kubernetes/tree/master/multi-node/aws)
- This image is built from the Alpine Linux base image.

[![](https://badge.imagelayers.io/danielwhatmuff/kube-aws-docker:latest.svg)](https://imagelayers.io/?images=danielwhatmuff/kube-aws-docker:latest 'Inspect Docker images at imagelayers.io')

# Requirements

- Docker :whale: - if you are on Mac, checkout the [Docker Toolbox](http://docs.docker.com/mac/step_one/)
- An AWS account and API credentials - [AWS](https://aws.amazon.com/)

# To build the Docker image and provision a cluster

### AWS Credentials
- The supported way to provide AWS credentials to kube-aws is by exporting the following environment variables:
```bash
export AWS_ACCESS_KEY_ID=AKID1234567890
export AWS_SECRET_ACCESS_KEY=MY-SECRET-KEY
```

### Cluster Assets

- Follow the kube-aws README to create the KMS key and cluster assets [README](https://github.com/coreos/coreos-kubernetes/blob/master/multi-node/aws/README.md)
- Run the container and mount the cluster assets to validate, render and provision.
```bash
$ docker run -v $(pwd):/root/ --rm danielwhatmuff/kube-aws-docker kube-aws < render | validate | up >
```
- Control the cluster using [danielwhatmuff/kubectl Docker image](https://github.com/danielwhatmuff/kubectl)
```bash
$ kubectl --kubeconfig=kubeconfig get nodes
```

### Contributing
File issues in GitHub to report bugs or issue a pull request to contribute.
