variable "instance_type" {
  default     = "t2.small"
}

variable "instance_count" {
  type = map(string)

  default = {
    "rest"            = 1
    "connect"         = 1
    "ksql"            = 1
    "schema"          = 1
    "control_center"  = 1
    "broker"          = 1
  }
}

variable "kafka_ami" {
  description = "Linux 2 AMI"
  default = "ami-0b69ea66ff7391e80"
}

variable "kafka_availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "kafka_sg" {}
variable "ssh_key" {}




