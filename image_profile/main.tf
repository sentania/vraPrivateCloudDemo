data "vra_image" "this" {
  for_each = {
    for m in var.image_mappings : m.image_name => m
  }
  filter = "name eq '${each.value.template_name}' and cloudAccountId eq '${var.cloud_account_id}'"
}

locals {
  merged_mappings = {
    for name, img in data.vra_image.this :
    name => {
      id           = img.id
      name         = img.name
      cloud_config = one([
        for m in var.image_mappings :
        m.cloud_config if m.image_name == name
      ])
    }
  }
}

resource "vra_image_profile" "this" {
  name        = var.image_profile_name
  description = var.image_description
  region_id   = var.region

  dynamic image_mapping {
    for_each = local.merged_mappings
    content {
    name         = image_mapping.value["name"]
    image_id     = image_mapping.value["id"]
    image_name   = image_mapping.value["name"]
    cloud_config = image_mapping.value["cloud_config"]
    }
  }
}