variable network_domain_name {
}
variable tier0_router {
}
variable capability_tags {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Zone"
  default = []
}
variable "name" {
}
variable "region" {
}
variable "cloud_account" {
}
variable "edgecluster" {
}
variable "logicalrouter" {
}

variable "addressSpace" {

}

variable "cidr" {
  
}
variable "addressMethod" {
  
}