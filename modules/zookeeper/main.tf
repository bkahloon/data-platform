resource "aws_instance" "zookeeper" {
  count = "${var.zookeeper_instance_count}"
  ami = "${var.zookeeper_ami}"
  instance_type = "${var.zookeeper_instance_type}"
  key_name = "${var.ssh_key}"
  availability_zone = var.zookeeper_availability_zones[count.index % length(var.zookeeper_availability_zones)]
  security_groups = [ var.zookeeper_sg ]
  tags = {
    Name = "zookeeper-${format("%02d", count.index+1)}"
  }
}

