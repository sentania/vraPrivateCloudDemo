
data "vra_region_enumeration_vsphere" "this" {
  username                = var.username
  password                = var.password
  hostname                = var.hostname
  accept_self_signed_cert = true
}

locals {
  filtered_regions = [
    for r in data.vra_region_enumeration_vsphere.this.external_regions :
    r
    if contains(var.enabled_datacenters, r.name)
  ]
}

resource "vra_cloud_account_vsphere" "this" {

  name        = replace(var.name, " ", "_")
  description = var.description
  username    = var.username
  password    = var.password
  hostname    = var.hostname
  dynamic "enabled_regions" {
    for_each = local.filtered_regions
    content {
      name               = enabled_regions.value.name
      external_region_id = enabled_regions.value.external_region_id
    }
  }
  associated_cloud_account_ids = var.nsxManager != "" ? [var.nsxManager] : []
  accept_self_signed_cert      = var.accept_self_signed_cert
  dynamic "tags" {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}