#  Introduction

This is a script with the sole purpose of deploying and configuring MongoDB in AWS EKS cluster, using Kubernetes `Storage Class` and `Stateful Sets` to create and manage the MongoDB replica.


## Technology Used 

- Amazon eksctl
- MongoDB Docker image
- Kubernetes
- Docker
- Containerization


## BEFORE YOU RUN THE SCRIPT DO THE FOLLOWING

Export the value of the following environment variables.
1. `export CLUSTER_NAME=<your cluster name>`
2. `export AWS_REGION=<your preferred aws region>`
3. `export NODE_NUM=<your preferred number`     


## How to Run Script

1. Ensure that you have the following files:
     - `k8s_config.sh`
     - `storage-class.yaml`
     - `rbac.yaml`
     - `lb-service.yaml`
     - `services.yaml`
     - `mongo-statefulset.yaml`


2. You can use this resources to set up  `eksctl`, `kubernetes` & `kubectl`  on your host machine:
 [Getting Started with eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
3. You can also use the link in `No 2.` to learn how to do a quick setup of a k8s cluster on `Amazon EKS`. You can use this resource instead to learn how to provison resources within your cluster: [Launch a Guest Book Application](https://docs.aws.amazon.com/eks/latest/userguide/eks-guestbook.html)

4. Run the command `cd k8s_mongodb` in order to enter the directory with the k8s objects (YAML files). 
5. In the `k8s_mongodb` directory, run the command `chmod 755 k8s_config.sh` 
6. When the `1 - 5` items have been done and the necessary values needed in the environment have been exported, then while in the `k8s_mongodb` directory, you should run the command `./k8s_config` script in for the process of the k8s cluster creation to begin.


### Resources Used
- [Learning Kubernetes on EKS by Doing Part 6](https://medium.com/faun/learning-kubernetes-on-eks-by-doing-part-6-statefulsets-5f71b31fe4e4)
- [mongodb-kubernetes-aws](https://github.com/spinaki/mongodb-kubernetes-aws)
- [Running MongoDB as a Microservice with Docker and Kubernetes](https://www.mongodb.com/blog/post/running-mongodb-as-a-microservice-with-docker-and-kubernetes)
- [Running a MongoDB Database in Kubernetes with StatefulSets](https://codelabs.developers.google.com/codelabs/cloud-mongodb-statefulset/index.html?index=..%2F..index#0)
- [Mongo Kubernetes Replica Set Sidecar](https://github.com/cvallance/mongo-k8s-sidecar)
- [Exposing StatefulSets in Kubernetes](https://itnext.io/exposing-statefulsets-in-kubernetes-698730fb92a1)

