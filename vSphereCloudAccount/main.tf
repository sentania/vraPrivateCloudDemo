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

data vsphere_datacenter "this" {
  for_each = toset(var.enabled_datacenters)
  name     = each.value
}

resource vra_cloud_account_vsphere "this" {
  name                    = replace(var.name, " ", "_")
  description             = var.description
  username                = var.username
  password                = var.password
  hostname                = var.hostname
  dcid                    = var.datacollector  != "" ? data.vra_data_collector.this[0].id : var.datacollector
  regions                 = [for v in data.vsphere_datacenter.this: format("Datacenter:%s", v.id)]
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