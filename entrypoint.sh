#!/bin/bash

export SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/name`.rancher.internal \
export SPARK_LOCAL_IP=`curl -s rancher-metadata/latest/self/container/primary_ip`

case "$1" in
    master)
        export MASTER=$SPARK_PUBLIC_DNS
        exec bin/spark-class org.apache.spark.deploy.master.Master --host $2
        ;;
    worker)
        exec bin/spark-class org.apache.spark.deploy.worker.Worker $2
        ;;
    livy)
        exec env | grep "SPARK"
        ;;
    bash)
        sh
        ;;
    *)
        echo $"Usage: {master|worker|livy|bash}"
        exit 1
    ;;
esac