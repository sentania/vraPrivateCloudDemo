data "vra_image" "this" {
  count = length(var.image_mappings)
  filter = "name eq '${var.image_mappings[count.index].template_name}' and cloudAccountId eq '${var.cloud_account}'"
}

resource "vra_image_profile" "this" {
  name        = var.image_name
  description = var.image_description
  region_id   = var.region

  dynamic image_mapping {
    for_each = var.image_mappings
    content {
      name              = image_mapping.image_name
      image_name        = image_mapping.template_name
      cloud_config      = image_mapping.cloud_config
    }
  }
}