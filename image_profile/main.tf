resource "vra_image_profile" "this" {
  name        = var.image_name
  description = var.image_description
  region_id   = var.region.id

  dynamic image_mapping {
    for_each = var.image_mappings
    content {
    name     = image_mapping.value["image_name"]
    //image_id = vra_image.this.id
    image_name = image_mapping.value["template_name"]
    cloud_config = image_mapping.value["cloud_config"]
    }
  }
}