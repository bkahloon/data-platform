variable "name" {}
variable "region" {
  default = "us-east-1"
}
variable "key_name" {}
variable "release_label" {}
variable "applications" {
  type = "list"
}
variable "master_ebs_size" {}
variable "master_instance_type" {}
variable "core_instance_type" {}
variable "core_instance_count" {}
variable "core_ebs_size" {}
variable "az" {}
variable "instance_type" {}
variable "zk_count" {}
variable "zk_ami" {}
variable "kafka_instance_count" {}
variable "kafka_ami" {}