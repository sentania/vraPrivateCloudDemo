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

variable datacollector {
  type = string
  default = ""
}

variable description {
  type = string
  default = ""
}

variable manager_mode {
   type = bool
   default = false
}
