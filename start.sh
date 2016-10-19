#!/bin/bash

case "$1" in
    master)
        SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/name`.rancher.internal \
        SPARK_LOCAL_IP=`curl -s rancher-metadata/latest/self/container/primary_ip` \
        exec bin/spark-class org.apache.spark.deploy.master.Master -h $2
        ;;
    worker)
        SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/name`.rancher.internal \
        SPARK_LOCAL_IP=`curl -s rancher-metadata/latest/self/container/primary_ip` \
        exec bin/spark-class org.apache.spark.deploy.worker.Worker $2
        ;;
    bash)
        export SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/primary_ip` \
        bash
        ;;
    *)
        echo $"Usage: $0 {master|worker|bash}"
          exit 1
    ;;
esac