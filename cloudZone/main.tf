resource "vra_zone" "this" {
  name        = replace(var.name, " ", "_")
  description = var.description
  region_id   = var.region
  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}
