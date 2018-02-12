#!/bin/bash
if [[ $(curl -s rancher-metadata/latest/self/container/name) -eq 1 ]]; then
    export SPARK_PUBLIC_DNS=`curl -s rancher-metadata/latest/self/container/name`.rancher.internal \
    export SPARK_LOCAL_IP=`curl -s rancher-metadata/latest/self/container/primary_ip`
else
    export SPARK_PUBLIC_DNS=$(hostname) \
    export SPARK_LOCAL_IP=$(hostname -i)
fi

case "$1" in
    master)
        export MASTER=$SPARK_PUBLIC_DNS
        exec bin/spark-class org.apache.spark.deploy.master.Master --host $2
        ;;
    worker)
        exec bin/spark-class org.apache.spark.deploy.worker.Worker $2
        ;;
    bash)
        sh
        ;;
    *)
        echo $"Usage: {master|worker|bash}"
        exit 1
    ;;
esac