resource "vra_zone" "this" {
  name        = replace(var.name, " ", "_")
  description = var.description
  region_id   = var.region
  folder           = var.folder
  #dynamic compute_ids {
  #   var.compute_ids
  #  }
  compute_ids      = var.compute_ids
  placement_policy = var.placement_policy
  dynamic tags_to_match {
    for_each = var.tags_to_match
      content {
        key   = tags_to_match.value["key"]
        value = tags_to_match.value["value"]
      }
  }

  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}
