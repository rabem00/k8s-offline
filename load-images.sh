#!/bin/bash
# Author: Marco Rabelink
# Description: docker load k8s images for offline use
#----------------------------------------------------------------

ARCH="amd64"

for ONE in $(ls images)
do
    docker load < images/${ONE}
done
