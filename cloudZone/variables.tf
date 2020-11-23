variable capability_tags {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Zone"
  default = []
}

variable "region" {
}

variable "name" {
}

variable "description" {
}

