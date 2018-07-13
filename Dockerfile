FROM arkhotech/java

WORKDIR /opt

RUN useradd -d /opt spark

RUN wget https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz 

RUN tar -xvzf spark-2.3.1-bin-hadoop2.7.tgz ; \
    chown -R spark:spark /opt ; \
    rm spark-2.3.1-bin-hadoop2.7.tgz

RUN mv /opt/spark-2.3.1-bin-hadoop2.7 /opt/spark
     
USER spark 

ENV HOME=/opt

ENV SPARK_HOME=/opt/spark

ENV PATH=$PATH:$SPARK_HOME/bin

CMD spark-shell


