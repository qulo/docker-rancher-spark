FROM qulo/spark:2.0.2-hadoop-2.8

RUN apt-get update \
 && apt-get install -y \
 git python-setuptools maven \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Set build path for Livy
ENV LIVY_BUILD_PATH /usr/build/livy
ENV LIVY_BUILD_VERSION livy-server-0.4.0-SNAPSHOT
ENV LIVY_APP_PATH /usr/$LIVY_BUILD_VERSION

# Clone Livy repository
RUN mkdir -p /usr/build && \
  cd /usr/build && \
    git clone https://github.com/cloudera/livy.git && \
  cd $LIVY_BUILD_PATH && \
    mvn -DskipTests -Dspark.version=$SPARK_VERSION clean package && \
    unzip $LIVY_BUILD_PATH/assembly/target/$LIVY_BUILD_VERSION.zip -d /usr && \
    rm -rf $LIVY_BUILD_PATH && \
  mkdir -p $LIVY_APP_PATH/upload

RUN rm /usr/bin/python && ln -s /usr/bin/python3.4 /usr/bin/python

WORKDIR $SPARK_HOME

RUN pip install numpy

ADD entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]