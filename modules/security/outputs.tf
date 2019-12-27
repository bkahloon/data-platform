output "emr_security_group" {
  value = "${aws_security_group.emr_security_group.id}"
}

output "kafka_security_group" {
  value = "${aws_security_group.kafka.id}"
}

output "zookeeper_security_group" {
  value = "${aws_security_group.zookeeper.id}"
}
