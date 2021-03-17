variable "access_key" {
}

variable "secret_key" {
}
variable description {
  type = string
  default = ""
}

variable name {
  type    = string
}
variable capability_tags {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Zone"
  default = []
}
variable enabled_regions {

}
