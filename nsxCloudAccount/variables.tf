variable name {
  type    = string
}

variable "username" {
}

variable "password" {
}

variable "hostname" {
}

variable capability_tags {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Account"
  default = []
}


variable description {
  type = string
  default = ""
}
