resource "aws_instance" "zookeeper" {
  count         = "${var.zookeeper_cluster_size}"
  ami           = "${var.ami}"
  instance_type = "${var.zookeeper_instance_type}"
  key_name      = "${var.key_name}"
  security_groups = ["${var.zk_sg}"]
  user_data     = "${data.template_file.user_data_zookeeper.rendered}"
  associate_public_ip_address = true
  tags {
    Name = "${var.project}-zookeeper",
    project = "${var.project}"
  }
}