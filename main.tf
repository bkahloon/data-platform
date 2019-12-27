module "iam" {
  source = "./modules/iam"
}

module "security" {
  source = "./modules/security"
}

module "emr" {
  source                                         = "./modules/emr"
  name                                           = "${var.name}"
  key_name                                       = "${var.key_name}"
  namespace                                      = var.namespace
  stage                                          = var.stage
  region                                         = var.region
  vpc_id                                         = var.vpc_id
  subnet_id                                      = var.subnets[0]
  ebs_root_volume_size                           = var.ebs_root_volume_size
  visible_to_all_users                           = var.visible_to_all_users
  release_label                                  = var.release_label
  applications                                   = var.applications
  configurations_json                            = var.configurations_json
  core_instance_group_instance_type              = var.core_instance_group_instance_type
  core_instance_group_instance_count             = var.core_instance_group_instance_count
  core_instance_group_ebs_size                   = var.core_instance_group_ebs_size
  core_instance_group_ebs_type                   = var.core_instance_group_ebs_type
  core_instance_group_ebs_volumes_per_instance   = var.core_instance_group_ebs_volumes_per_instance
  master_instance_group_instance_type            = var.master_instance_group_instance_type
  master_instance_group_instance_count           = var.master_instance_group_instance_count
  master_instance_group_ebs_size                 = var.master_instance_group_ebs_size
  master_instance_group_ebs_type                 = var.master_instance_group_ebs_type
  master_instance_group_ebs_volumes_per_instance = var.master_instance_group_ebs_volumes_per_instance
  create_task_instance_group                     = var.create_task_instance_group
  task_instance_group_bid_price                  = var.task_instance_group_bid_price
  task_instance_group_instance_type              = var.task_instance_group_instance_type
  task_instance_group_instance_count             = var.task_instance_group_instance_count
  subnet_type                                    = "public"
}

module "zookeeper" {
  source                       = "./modules/zookeeper"
  zookeeper_instance_count     = "${var.zk_count}"
  zookeeper_ami                = "${var.zk_ami}"
  zookeeper_instance_type      = "${var.instance_type}"
  zookeeper_availability_zones = "${var.az}"
  zookeeper_sg                 = "${module.security.zookeeper_security_group}"
  ssh_key                      = "${var.key_name}"
}

module "kafka" {
  source                   = "./modules/kafka"
  instance_count           = "${var.kafka_instance_count}"
  instance_type            = "${var.instance_type}"
  kafka_availability_zones = "${var.az}"
  kafka_sg                 = "${module.security.kafka_security_group}"
  ssh_key                  = "${var.key_name}"
}
