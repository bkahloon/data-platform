variable "name" {
  default = "data-platform-test"
}
variable "key_name" {}
variable "release_label" {}
variable "applications" {
  type = "list"
}
variable "master_instance_type" {
  default = "m1.medium"
}
variable "master_ebs_size" {
  default = 20
}
variable "core_instance_type" {
  default = "m1.medium"
}
variable "core_instance_count" {
  default = 1
}
variable "ssh_sg" {}
variable "core_ebs_size" {
  default = 50
}
variable "emr_master_security_group" {}
variable "emr_slave_security_group" {}
variable "emr_ec2_instance_profile" {}
variable "emr_service_role" {}
variable "emr_autoscaling_role" {}
