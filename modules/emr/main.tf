resource "aws_emr_cluster" "emr-cluster" {
  name = "${var.name}"
  release_label = "${var.release_label}"
  applications = "${var.applications}"
  termination_protection = false

  ec2_attributes {
    key_name = "${var.key_name}"
    emr_managed_master_security_group = "${var.emr_master_security_group}"
    emr_managed_slave_security_group = "${var.emr_slave_security_group}"
    instance_profile = "${var.emr_ec2_instance_profile}"
    additional_master_security_groups = "${var.ssh_sg}"
    additional_slave_security_groups = "${var.ssh_sg}"
  }

  ebs_root_volume_size = "20"

  master_instance_group {
    instance_type = "${var.master_instance_type}"
  }
  core_instance_group {
    instance_type = "${var.core_instance_type}"
    instance_count = "${var.core_instance_count}"
  }

  bootstrap_action {
    name = "Set up kafka cli"
    path = "./templates/bootstrap_actions.sh"
  }

  tags {
      Name = "${var.name} - Spark cluster"
    }

  service_role = "${var.emr_service_role}"
  autoscaling_role = "${var.emr_autoscaling_role}"

}