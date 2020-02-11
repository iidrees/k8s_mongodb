#!/bin/bash


set -ex 


# cd k8s_mongodb/

CWD_CONFIG=`pwd`

# Create the Kubernetes cluster on EKS here.
# A cluster with 3 nodes in your preferred region and cluster name
# Please ensure that you have eks installed on your machine using this 
# Documentation link https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html
create_k8s_cluster () {
    
    eksctl create cluster --name=$CLUSTER_NAME --region=$AWS_REGION --nodes=$NODE_NUMS
}

# After the cluster is created, we create the mongodb resource within it
# with the different configurations we intend.
create_mongodb_k8s_resources () {
    printf "+++++++++++++++++++++++++++++++++++++++ BEGINS MONGODB REPO CONFIG +++++++++++++++++++++++++++++++++++++++"

    kubectl apply -f $CWD_CONFIG/storage-class.yaml
    kubectl patch storageclass sc-gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
    kubectl apply -f $CWD_CONFIG/services.yaml
    kubectl apply -f $CWD_CONFIG/rbac.yaml
    kubectl apply -f $CWD_CONFIG/mongo-statefulset.yaml
    kubectl apply -f $CWD_CONFIG/lb-service.yaml


    printf "+++++++++++++++++++++++++++++++++++++++ COMPLETES MONGODB REPO CONFIG +++++++++++++++++++++++++++++++++++++++"
}


create_k8s_cluster
create_mongodb_k8s_resources