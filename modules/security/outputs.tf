output "emr_master_security_group" {
  value = "${aws_security_group.emr_master.id}"
}

output "emr_slave_security_group" {
  value = "${aws_security_group.emr_slave.id}"
}

output "kafka_security_group" {
  value = "${aws_security_group.kafka.id}"
}

output "zookeeper_security_group" {
  value = "${aws_security_group.zookeeper.id}"
}