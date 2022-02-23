provider "vsphere" {
  user           = var.username
  password       = var.password
  vsphere_server = var.hostname
  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data vra_data_collector "this" {
  count = var.datacollector != "" ? 1 : 0
  name = var.datacollector
}

data vra_region_enumeration_vsphere "this" {
  dcid                    = var.datacollector  != "" ? data.vra_data_collector.this[0].id : var.datacollector
}

resource vra_cloud_account_vsphere "this" {
  name                    = replace(var.name, " ", "_")
  description             = var.description
  username                = var.username
  password                = var.password
  hostname                = var.hostname
  dcid                    = var.datacollector  != "" ? data.vra_data_collector.this[0].id : var.datacollector
  regions                 = data.vra_region_enumeration_vsphere.this.regions
  associated_cloud_account_ids = var.nsxManager != "" ? [var.nsxManager] : []
  accept_self_signed_cert = var.accept_self_signed_cert
  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}