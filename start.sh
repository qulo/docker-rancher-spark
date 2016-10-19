#!/bin/bash

case "$0" in
    master)
        SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/name`.rancher.internal \
        SPARK_LOCAL_IP=`curl -s rancher-metadata/latest/self/container/primary_ip` \
        MASTER=$SPARK_PUBLIC_DNS \
        exec bin/spark-class org.apache.spark.deploy.master.Master -h $1
        ;;
    worker)
        SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/name`.rancher.internal \
        SPARK_LOCAL_IP=`curl -s rancher-metadata/latest/self/container/primary_ip` \
        exec bin/spark-class org.apache.spark.deploy.worker.Worker $1
        ;;
    bash)
        SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/name`.rancher.internal \
        SPARK_LOCAL_IP=`curl -s rancher-metadata/latest/self/container/primary_ip` \
        sh
        ;;
    *)
        echo $"Usage: {master|worker|bash}"
        exit 1
    ;;
esac