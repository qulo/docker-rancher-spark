# spark-rancher

A [Apache Spark](http://spark.apache.org) image for [Rancher](http://rancher.com) based on the docker container [gettyimages/docker-spark] (https://github.com/gettyimages/docker-spark). Used to spin up a easy to manage spark cluster on Rancher. 

## Versions

* [Oracle Java](https://www.oracle.com/java/index.html) - v8.0_112
* [Apache Spark](http://spark.apache.org) - v2.1.0
* [Apache Hadoop](http://hadoop.apache.org) - v2.7.3
* [Livy](http://livy.io) - v0.4.0-SNAPSHOT

## Prerequisites

To start the spark cluster, you need a running Rancher-Cluster (Cattle)

## Installing

> not implemented yet

1. Add this repository to your Rancher Custom Catalogs `Admin -> Settings -> Add Catalog`
2. Browse to the custom Catalog `Catalog -> Spark-Rancher` and install