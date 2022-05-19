
resource "vra_cloud_account_azure" "this" {
  name        = replace(var.name, " ", "_")
  description = var.description

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  application_id  = var.application_id
  application_key = var.application_key
  regions = var.enabled_regions

  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}
