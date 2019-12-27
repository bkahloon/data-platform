resource "aws_instance" "rest" {
    count = "${var.instance_count["rest"]}"
    ami = "${var.kafka_ami}"
    instance_type = "${var.instance_type}" 
    key_name = "${var.ssh_key}"
  vpc_security_group_ids = [ var.kafka_sg
 ]
    availability_zone = var.kafka_availability_zones[count.index % length(var.kafka_availability_zones)]
    associate_public_ip_address = true
    source_dest_check = false
    tags = {
        Name = "kafka-rest-${format("%02d", count.index+1)}"
    }
}

resource "aws_instance" "connect" {
    count = "${var.instance_count["connect"]}"
    ami = "${var.kafka_ami}"
    instance_type = "${var.instance_type}" 
    key_name = "${var.ssh_key}"
      vpc_security_group_ids = [ var.kafka_sg
 ]
    availability_zone = var.kafka_availability_zones[count.index % length(var.kafka_availability_zones)]
    associate_public_ip_address = true
    source_dest_check = false
    tags = {
        Name = "kafka-connect-${format("%02d", count.index+1)}"
    }
}

resource "aws_instance" "ksql" {
    count = "${var.instance_count["ksql"]}"
    ami = "${var.kafka_ami}"
    instance_type = "${var.instance_type}" 
    key_name = "${var.ssh_key}"
      vpc_security_group_ids = [ var.kafka_sg
 ]

    availability_zone = var.kafka_availability_zones[count.index % length(var.kafka_availability_zones)]
    associate_public_ip_address = true
    source_dest_check = false
    tags = {
        Name = "kafka-ksql-${format("%02d", count.index+1)}"
    }
}
resource "aws_instance" "control_center" {
    count = "${var.instance_count["control_center"]}"
    ami = "${var.kafka_ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ssh_key}"
      vpc_security_group_ids = [ var.kafka_sg
 ]

    availability_zone = var.kafka_availability_zones[count.index % length(var.kafka_availability_zones)]
    associate_public_ip_address = true
    source_dest_check = false
    tags = {
        Name = "kafka-control-center-${format("%02d", count.index+1)}"
    }
}

resource "aws_instance" "schema" {
    count = "${var.instance_count["schema"]}"
    ami = "${var.kafka_ami}"
    instance_type = "${var.instance_type}" 
    key_name = "${var.ssh_key}"
      vpc_security_group_ids = [ var.kafka_sg
 ]

    availability_zone = var.kafka_availability_zones[count.index % length(var.kafka_availability_zones)]
    associate_public_ip_address = true
    source_dest_check = false
    tags = {
        Name = "kafka-schema-${format("%02d", count.index+1)}"
    }
}

resource "aws_instance" "broker" {
    count = "${var.instance_count["broker"]}"
    ami = "${var.kafka_ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ssh_key}"
    vpc_security_group_ids = [ var.kafka_sg
 ]

    availability_zone = var.kafka_availability_zones[count.index % length(var.kafka_availability_zones)]
    associate_public_ip_address = true
    source_dest_check = false
    tags = {
        Name = "kafka-broker-${format("%02d", count.index+1)}"
    }
}