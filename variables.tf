variable "name" {}
variable "key_name" {}
variable "az" {}
variable "instance_type" {}
variable "zk_count" {}
variable "zk_ami" {}
variable "kafka_instance_count" {}
variable "kafka_ami" {}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
  default     = ["us-east-1a"]
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = "eg"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`, `infra`)"
  default     = "dev"
}

variable "ebs_root_volume_size" {
  type        = number
  description = "Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance. Available in Amazon EMR version 4.x and later"
  default     = 50
}

variable "visible_to_all_users" {
  type        = bool
  description = "Whether the job flow is visible to all IAM users of the AWS account associated with the job flow"
  default     = true
}

variable "release_label" {
  type        = string
  description = "The release label for the Amazon EMR release. https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html"
  default     = "emr-5.28.0"
}

variable "applications" {
  type        = list(string)
  description = "A list of applications for the cluster. Valid values are: Flink, Ganglia, Hadoop, HBase, HCatalog, Hive, Hue, JupyterHub, Livy, Mahout, MXNet, Oozie, Phoenix, Pig, Presto, Spark, Sqoop, TensorFlow, Tez, Zeppelin, and ZooKeeper (as of EMR 5.25.0). Case insensitive"
  default     = ["Flink", "Ganglia", "Hadoop", "HBase", "HCatalog", "Hive", "Hue", "JupyterHub", "Livy", "Mahout", "MXNet", "Oozie", "Phoenix", "Pig", "Presto", "Spark", "Sqoop", "Tensorflow", "Tez", "Zeppelin"]
}

variable "configurations_json" {
  type        = string
  description = "A JSON string for supplying list of configurations for the EMR cluster"
  default     = null
}

variable "core_instance_group_instance_type" {
  type        = string
  description = "EC2 instance type for all instances in the Core instance group"
  default     = "m5.xlarge"
}

variable "core_instance_group_instance_count" {
  type        = number
  description = "Target number of instances for the Core instance group. Must be at least 1"
  default     = 1
}

variable "core_instance_group_ebs_size" {
  type        = number
  description = "Core instances volume size, in gibibytes (GiB)"
  default     = 500
}

variable "core_instance_group_ebs_type" {
  type        = string
  description = "Core instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1`"
  default     = "st1"
}

variable "core_instance_group_ebs_volumes_per_instance" {
  type        = number
  description = "The number of EBS volumes with this configuration to attach to each EC2 instance in the Core instance group"
  default     = 1
}

variable "master_instance_group_instance_type" {
  type        = string
  description = "EC2 instance type for all instances in the Master instance group"
  default     = "m5.xlarge"
}

variable "master_instance_group_instance_count" {
  type        = number
  description = "Target number of instances for the Master instance group. Must be at least 1, greater than 1 for highly available cluster"
  default     = 1
}

variable "master_instance_group_ebs_size" {
  type        = number
  description = "Master instances volume size, in gibibytes (GiB)"
  default     = 50
}

variable "master_instance_group_ebs_type" {
  type        = string
  description = "Master instances volume type. Valid options are `gp2`, `io1`, `standard` and `st1`"
  default     = "gp2"
}

variable "master_instance_group_ebs_volumes_per_instance" {
  type        = number
  description = "The number of EBS volumes with this configuration to attach to each EC2 instance in the Master instance group"
  default     = 1
}

variable "create_task_instance_group" {
  type        = bool
  description = "Whether to create an instance group for Task nodes. For more info: https://www.terraform.io/docs/providers/aws/r/emr_instance_group.html, https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-master-core-task-nodes.html"
  default     = true
}


variable "generate_ssh_key" {
  type        = bool
  description = "If set to `true`, new SSH key pair will be created"
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "default vpc id"
  default     = "vpc-d1ca7dab"
}

variable "subnets" {
  type        = list(string)
  description = "default list of  subnets"
  default     = ["subnet-08b3d526", "subnet-48238c76", "subnet-48238c76", "subnet-48238c76", "subnet-48238c76", "subnet-48238c76"]
}

variable "bootstrap_action" {
  type = list(object({
    path = string
    name = string
    args = list(string)
  }))
  description = "List of bootstrap actions that will be run before Hadoop is started on the cluster nodes"
  default     = []
}


variable "task_instance_group_instance_type" {
  type        = string
  description = "EC2 instance type for all instances in the Task instance group"
  default     = "c3.xlarge"
}

variable "task_instance_group_instance_count" {
  type        = number
  description = "Target number of instances for the Task instance group. Must be at least 1"
  default     = 2
}



variable "task_instance_group_bid_price" {
  type        = string
  description = "Bid price for each EC2 instance in the Task instance group, expressed in USD. By setting this attribute, the instance group is being declared as a Spot Instance, and will implicitly create a Spot request. Leave this blank to use On-Demand Instances"
  default     = 0.500
}
