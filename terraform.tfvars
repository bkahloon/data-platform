# EMR general configurations
release_label = "emr-5.16.0"
applications  = ["Flink", "Hadoop", "JupyterHub", "Livy", "Spark"]
zk_count      = 3
kafka_instance_count = { "rest" = 1
  "connect"        = 1
  "ksql"           = 1
  "schema"         = 1
  "control_center" = 1
"broker" = 3 }
az            = ["us-east-1a", "us-east-1b", "us-east-1c"]
instance_type = "t2.medium"
kafka_ami     = "ami-0c322300a1dd5dc79"
zk_ami        = "ami-0c322300a1dd5dc79"