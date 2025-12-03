########################################
# General VCF-A Configuration
########################################

variable "vcfa_url" {
  type = string
}

variable "vcfa_refresh_token" {
  type      = string
  sensitive = true
}

variable "insecure" {
  type    = bool
  default = true
}

variable "serviceAccountUserName" {
  type = string
}

variable "serviceAccountPassword" {
  type      = string
  sensitive = true
}

########################################
# NSX Cloud Accounts
#
# Structure (map):
#   nsx_accounts = {
#     key = {
#       name            = string
#       hostname        = string
#       capability_tags = list(object({
#         key   = string
#         value = string
#       }))
#     }
#   }
########################################

variable "nsx_accounts" {
  description = "Map of NSX cloud account definitions"
  type = map(object({
    name     = string
    hostname = string
    capability_tags = list(object({
      key   = string
      value = string
    }))
  }))
}


########################################
# vSphere Cloud Accounts
#
# Structure (map):
#   vsphere_accounts = {
#     key = {
#       name                = string
#       hostname            = string
#       description         = string
#       enabled_datacenters = list(string)
#       nsxManager          = string
#       capability_tags = list(object({
#         key   = string
#         value = string
#       }))
#       image_mappings = list(object({
#         image_name    = string
#         template_name = string
#         cloud_config  = string
#       }))
#     }
#   }
########################################

variable "vsphere_accounts" {
  description = "Map of vSphere cloud account definitions"
  type = map(object({
    name                = string
    hostname            = string
    description         = string
    enabled_datacenters = list(string)
    nsxManager          = string
    capability_tags = list(object({
      key   = string
      value = string
    }))
    image_mappings = list(object({
      image_name    = string
      template_name = string
      cloud_config  = string
    }))
  }))
}

variable "projects" {
  description = "Map of project definitions"
  type = map(object({
    name           = string
    description    = string
    basename       = string
    administrators = list(string)
  }))
}
