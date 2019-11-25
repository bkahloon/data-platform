variable "zookeeper_instance_count" {
  type = number
  default = 1
}

variable "zookeeper_ami" {
  description = "Linux 2 AMI"
  default = "ami-0b69ea66ff7391e80"
}

variable "zookeeper_instance_type" {
  default     = "t2.small"
}

variable "zookeeper_availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "zookeeper_sg" {}
variable "ssh_key" {}