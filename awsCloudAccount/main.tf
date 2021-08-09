data aws_regions "this" {
  for_each = toset(var.enabled_regions)
  name     = each.value
}

resource "vra_cloud_account_aws" "this" {
  name        = replace(var.name, " ", "_")
  description = var.description
  access_key  = var.access_key
  secret_key  = var.secret_key
  regions     = var.enabled_regions

  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}
