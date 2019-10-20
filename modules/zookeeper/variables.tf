variable "zookeeper_instance_type" {
  default = "t2.micro"
}
variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "zookeeper_cluster_size" {
  default = "3"
}

variable "project" {
  default = "zk-cluster"
}

variable "ami" {
  description = "Linux 2 AMI"
  default = "ami-0b69ea66ff7391e80"
}
variable "key_name" {}
variable "zk_sg" {}

