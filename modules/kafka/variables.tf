variable "kafka_instance_type" {
  default = "t2.small"
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "kafka_cluster_size" {
  default = "3"
}

variable "project" {
  default = "kafka-cluster"
}

variable "ami" {
  description = "Linux 2 AMI"
  default = "ami-0b69ea66ff7391e80"
}
variable "key_name" {}
variable "kf_sg" {}

