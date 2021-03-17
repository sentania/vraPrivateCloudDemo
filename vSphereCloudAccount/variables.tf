variable name {
  type    = string
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

variable hostname {
  type = string
}

variable username {
  type = string
}

variable password {
  type = string
}

variable accept_self_signed_cert {
  type = bool
  default = true
}

variable enabled_datacenters {
  type = list
}

variable nsxManager {
}