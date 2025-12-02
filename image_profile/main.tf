data "vra_image" "lookup" {
  for_each = {
    for img in var.image_mappings :
    img.image_name => img
  }

  filter = "name eq '${each.value.template_name}' and cloudAccountId eq '${var.cloud_account_id}'"
}
locals {
  # Convert input list to a map keyed by image_name
  image_input_map = {
    for im in var.image_mappings :
    im.image_name => im
  }
}

locals {
  merged_mappings = {
    for name, img in data.vra_image.lookup :
    name => {
      id           = img.id
      external_id  = img.external_id
      name         = img.name
      image_name   = local.image_input_map[name].image_name
      cloud_config = local.image_input_map[name].cloud_config
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
      name              = image_mapping.value["image_name"]
      image_id          = image_mapping.value["id"]
      cloud_config      = image_mapping.value["cloud_config"]
    }
  }
}