# spark-rancher

A [Apache Spark](http://spark.apache.org) image for [Rancher](http://rancher.com) based on the docker container [gettyimages/docker-spark] (https://github.com/gettyimages/docker-spark). Used to spin up a easy to manage spark cluster on Rancher. 

## Versions

* [Oracle Java](https://www.oracle.com/java/index.html) - v8.131_11
* [Apache Spark](http://spark.apache.org) - v2.1.1
* [Apache Hadoop](http://hadoop.apache.org) - v2.8.0
* [Livy](http://livy.io) - v0.4.0-SNAPSHOT


## Running locally
``` 
# starting spark master:
docker run qulo/rancher-spark master <hostname or ip of the master>

# starting spark worker:
docker run qulo/rancher-spark worker <hostname or ip of the master>
```

## Running with docker-compose
```
# starting
docker-compose up

# skaling workers to 3
docker-compose scale spark-worker=3

# stopping
docker-compose stop
```

## Running in Rancher
###### WARNING: this will open port 8080 on the spark-master to public
create a service stack and use [docker-compose.yml](docker-compose.yml) service creation.