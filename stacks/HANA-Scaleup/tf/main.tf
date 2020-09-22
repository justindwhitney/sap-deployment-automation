provider "google" {}

module "gcp_sap_hana" {
  source                     = "../../../terraform/modules/hana"
  subnetwork                 = var.subnetwork
  linux_image_family         = var.linux_image_family
  linux_image_project        = var.linux_image_project
  instance_name              = var.instance_name
  instance_type              = var.instance_type
  subnetwork_project         = local.subnetwork_project
  project_id                 = var.project_id
  zone                       = var.zone
  service_account_email      = var.service_account_email
  boot_disk_type             = var.boot_disk_type
  boot_disk_size             = var.boot_disk_size
  autodelete_disk            = "true"
  pd_ssd_size                = local.pd_ssd_size
  pd_hdd_size                = local.pd_hdd_size
  sap_hana_deployment_bucket = var.sap_hana_deployment_bucket
  sap_deployment_debug       = "false"
  post_deployment_script     = var.post_deployment_script
  sap_install_files_bucket   = var.sap_install_files_bucket
  sap_hostagent_file_name    = var.sap_hostagent_file_name
  sap_hana_bundle_file_name  = var.sap_hana_bundle_file_name
  sap_hana_sapcar_file_name  = var.sap_hana_sapcar_file_name
  sap_hana_sid               = var.sap_hana_sid
  sap_hana_instance_number   = var.sap_hana_instance_number
  sap_hana_sidadm_password   = var.sap_hana_sidadm_password
  sap_hana_system_password   = var.sap_hana_system_password
  network_tags               = var.network_tags
  sap_hana_sidadm_uid        = 900
  sap_hana_sapsys_gid        = 900
  public_ip                  = var.public_ip
  address_name               = "${var.instance_name}-reservedip"
  gce_ssh_user               = var.gce_ssh_user
  gce_ssh_pub_key_file       = var.gce_ssh_pub_key_file
}