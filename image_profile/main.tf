data "vra_image" "this" {
  filter = "name eq '${var.template_name}'"
}


resource "vra_image_profile" "this" {
  name        = var.image_name
  description = var.image_description
  region_id   = var.region.id

  image_mapping {
    name     = var.template_name
    image_id = data.vra_image.this.id

    cloud_config = var.cloud_config
  }
}