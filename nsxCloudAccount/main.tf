data "vra_data_collector" "dc" {
  count = var.datacollector != "" ? 1 : 0
  name  = var.datacollector
}

resource "vra_cloud_account_nsxt" "this" {
  name        = replace(var.name, " ", "_")
  description = var.description
  username    = var.username
  password    = var.password
  hostname    = var.hostname
  dc_id       = var.datacollector != "" ? data.vra_data_collector.dc[0].id : ""
  accept_self_signed_cert = true
  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}

