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
az                   = ["us-east-1a", "us-east-1b", "us-east-1c"]
core_ebs_size        = 50
core_instance_count  = 2
core_instance_type   = "m1.medium"
instance_type        = "t2.medium"
kafka_ami            = "ami-0b69ea66ff7391e80"
master_ebs_size      = 20
master_instance_type = "m1.medium"
zk_ami               = "ami-0b69ea66ff7391e80"