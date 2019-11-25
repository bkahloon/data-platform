module "iam" {
  source = "./modules/iam"
}

module "security" {
  source              = "./modules/security"
}

module "emr" {
  source                    = "./modules/emr"
  name                      = "${var.name}"
  release_label             = "${var.release_label}"
  applications              = "${var.applications}"
  subnet_id                 = "${var.subnet_id}"
  key_name                  = "${var.key_name}"
  master_instance_type      = "${var.master_instance_type}"
  master_ebs_size           = "${var.master_ebs_size}"
  core_instance_type        = "${var.core_instance_type}"
  core_instance_count       = "${var.core_instance_count}"
  core_ebs_size             = "${var.core_ebs_size}"
  emr_master_security_group = "${module.security.emr_master_security_group}"
  emr_slave_security_group  = "${module.security.emr_slave_security_group}"
  emr_ec2_instance_profile  = "${module.iam.emr_ec2_instance_profile}"
  emr_service_role          = "${module.iam.emr_service_role}"
  emr_autoscaling_role      = "${module.iam.emr_autoscaling_role}"
}

module "zookeeper"{
  source                    = "./modules/zookeeper"
  zookeeper_instance_count  = "${var.zk_count}"
  zookeeper_ami   = "${var.zk_ami}"
  zookeeper_instance_type = "${var.zk_instance_type}"
  zookeeper_availability_zones  = "${var.zk_az}"
  zookeeper_sg = "${module.security.zookeeper_security_group}"
  ssh_key = "${var.key_name}"

}
