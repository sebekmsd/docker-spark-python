
from pyspark import SparkContext
from pyspark.sql import SQLContext

    # SparkConf().set("spark.jars.packages","org.apache.hadoop:hadoop-aws:3.0.0-alpha3")
sc = SparkContext.getOrCreate()


sqlContext = SQLContext(sc)
#df2 = sqlContext.read.parquet("s3n://bci-seguros-datalake/P01/R_P01_ACSEL/acs_detalle_comision/run-1529437070521-part-r-00000")

s3File = sc.textFile("s3n://bci-seguros-datalake/P01/R_P01_ACSEL/acs_detalle_comision/run-1529437070521-part-r-00000")

s3File.map(lambda line : line.split(",")).collect()

