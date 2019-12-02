# EMR general configurations
release_label = "emr-5.16.0"
applications  = ["Hadoop", "Spark"]
zk_count      = 3
kafka_instance_count = { "rest" = 1
  "connect"        = 1
  "ksql"           = 1
  "schema"         = 1
  "control_center" = 1
"broker" = 1 }
