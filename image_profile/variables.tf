variable "region" {
}

variable "image_name" {
}
variable "image_description" {
}
variable "cloud_account" {
}
variable "image_mappings" {
  type        = list(map(string))
  description = "Image mappings for a region"
  default = []
}