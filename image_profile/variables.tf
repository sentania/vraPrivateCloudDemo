variable "region" {
}

variable "image_name" {
}
variable "image_description" {
}
variable "cloud_account" {
}
variable "image_mappings" {
  type = list(object({
    image_name        = string
    template_name     = string
    cloud_config      = string
  }))
  default = []
}
