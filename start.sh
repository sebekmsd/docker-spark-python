#!/bin/bash

#docker run -ti --rm arkhotech/spark:python /bin/bash

docker run -ti --rm -v $(pwd)/spark-env.sh:/opt/spark/conf/spark-env.sh \
     -v $(pwd)/spark.properties:/opt/spark/conf/spark-defaults.conf \
     --hostname master.arkho.tech \
     -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
     -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
     -e AWS_DEFAULT_REGION=us-east-1 \
     arkhotech/spark:python 
