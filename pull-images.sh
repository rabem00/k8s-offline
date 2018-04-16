#!/bin/bash
# Author: Marco Rabelink
# Description: pull k8s images for offline use
#----------------------------------------------------------------

ARCH="amd64"

docker pull k8s.gcr.io/kube-apiserver-${ARCH}:v1.9.6
docker pull k8s.gcr.io/kube-controller-manager-${ARCH}:v1.9.6
docker pull k8s.gcr.io/kube-scheduler-${ARCH}:v1.9.6
docker pull k8s.gcr.io/kube-proxy-${ARCH}:v1.9.6
docker pull k8s.gcr.io/etcd-${ARCH}:3.1.10
docker pull k8s.gcr.io/pause-${ARCH}:3.0
docker pull k8s.gcr.io/k8s-dns-sidecar-${ARCH}:1.14.7
docker pull k8s.gcr.io/k8s-dns-kube-dns-${ARCH}:1.14.7
docker pull k8s.gcr.io/k8s-dns-dnsmasq-nanny-${ARCH}:1.14.7
docker pull weaveworks/weave-npc:2.0.5
docker pull weaveworks/weave-kube:2.0.5

mkdir images
for ONE in $(docker images --format '{{.Repository}}:{{.Tag}}')
do
    NAME=${ONE##*/}
    echo "Saving ${NAME}.tar"
    docker save ${ONE} -o images/${NAME}.tar
done

docker rmi k8s.gcr.io/kube-apiserver-${ARCH}:v1.9.6
docker rmi k8s.gcr.io/kube-controller-manager-${ARCH}:v1.9.6
docker rmi k8s.gcr.io/kube-scheduler-${ARCH}:v1.9.6
docker rmi k8s.gcr.io/kube-proxy-${ARCH}:v1.9.6
docker rmi k8s.gcr.io/etcd-${ARCH}:3.1.10
docker rmi k8s.gcr.io/pause-${ARCH}:3.0
docker rmi k8s.gcr.io/k8s-dns-sidecar-${ARCH}:1.14.7
docker rmi k8s.gcr.io/k8s-dns-kube-dns-${ARCH}:1.14.7
docker rmi k8s.gcr.io/k8s-dns-dnsmasq-nanny-${ARCH}:1.14.7
docker rmi weaveworks/weave-npc:2.0.5
docker rmi weaveworks/weave-kube:2.0.5
