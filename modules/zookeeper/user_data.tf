data "template_file" "user_data_zookeeper" {
  template = "${path.module}/templates/zookeeper_install.tpl"

  vars {
    app_type = "zookeeper",
    zookeeper_ips = "",
    hosted_zone_id = "",
    hosted_zone_name = ""
  }
}