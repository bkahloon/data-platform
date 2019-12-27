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
  description = "Redhat AMI"
  default = "ami-0c322300a1dd5dc79"
}

variable "kafka_availability_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "kafka_sg" {}
variable "ssh_key" {}




