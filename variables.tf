variable "name" {}
variable "region" {
  default = "us-east-1"
}
variable "key_name" {}
variable "release_label" {}
variable "applications" {
  type = "list"
}
variable "subnet_id" {}
variable "master_ebs_size" {}
variable "master_instance_type" {}
variable "core_instance_type" {}
variable "core_instance_count" {}
variable "core_ebs_size" {}
