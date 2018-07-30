FROM arkhotech/java

WORKDIR /opt

RUN useradd -d /opt spark

RUN wget https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz 

RUN wget http://archive.apache.org/dist/hadoop/common/hadoop-2.8.3/hadoop-2.8.3.tar.gz 

RUN tar -xvzf spark-2.3.1-bin-hadoop2.7.tgz ; \
    chown -R spark:spark /opt ; \
    rm spark-2.3.1-bin-hadoop2.7.tgz

RUN gunzip hadoop-2.8.3.tar.gz ;\ 
    tar -xvf hadoop-2.8.3.tar ;\ 
    rm hadoop-2.8.3.tar; \
    pip install awscli --upgrade --user ;\
    pip install boto3 ;\
    chown -R spark:spark /opt/*

RUN mv /opt/spark-2.3.1-bin-hadoop2.7 /opt/spark

RUN apt-get install -y python python-pip python-dev build-essential 

RUN pip install --upgrade pip 

RUN pip install pyspark 
     
USER spark 

ENV HOME=/opt

ENV SPARK_HOME=/opt/spark

ENV PATH=$PATH:$SPARK_HOME/bin

ENV HADOOP_HOME=/opt/hadoop-2.8.3

ENV HADOOP_CLASSPATH=$HADOOP_HOME/share/hadoop/tools/lib

USER spark

COPY spark.properties $SPARK_HOME/conf/spark-default.conf

WORKDIR /opt

COPY spark.properties $SPARK_HOME/conf/spark-defaults.conf

COPY spark-env.sh /opt/spark/conf/spark-env.sh 

#Instalar el driver para Redshift
RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.4.jar ; \
    cp postgresql-42.2.4.jar /opt/spark/jars ;\
    cp postgresql-42.2.4.jar $HADOOP_HOME/share/hadoop/tools/lib

LABEL maintainer="msilva@arkhotech.com" \
      vendor="Arkhotech SpA" \
      version="1.0" \
      description="Contendor Spark para ambiente de desarrollo y multi nodo"



CMD $SPARK_HOME/bin/pyspark
