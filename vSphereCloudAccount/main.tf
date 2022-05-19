 data "vra_data_collector" "dc" {
  count = var.datacollector != "" ? 1 : 0
  name  = var.datacollector
}

data "vra_region_enumeration_vsphere" "this" {
  username                = var.username
  password                = var.password
  hostname                = var.hostname
  dcid                    = var.datacollector != "" ? data.vra_data_collector.dc[0].id : "" // Required for vRA Cloud, Optional for vRA 8.X
  accept_self_signed_cert = true
}


resource vra_cloud_account_vsphere "this" {
  name                    = replace(var.name, " ", "_")
  description             = var.description
  username                = var.username
  password                = var.password
  hostname                = var.hostname
  dcid                    = var.datacollector  != "" ? data.vra_data_collector.dc[0].id : var.datacollector
  regions                      = data.vra_region_enumeration_vsphere.this.regions
  associated_cloud_account_ids = var.nsxManager != "" ? [var.nsxManager] : []
  accept_self_signed_cert = true
  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}
