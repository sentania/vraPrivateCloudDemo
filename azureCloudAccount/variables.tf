variable "subscription_id" {
}

variable "tenant_id" {
}

variable "application_id" {
}

variable "application_key" {
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