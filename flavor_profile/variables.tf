variable region_id {

}

variable flavor_mappings {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Account"
  default = []
}
