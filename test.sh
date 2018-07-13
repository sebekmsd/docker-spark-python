#!/bin/bash

docker exec -ti spark_master_1 spark-submit --master spark://master:7077 /opt/scripts/test.py
