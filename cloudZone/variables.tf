variable "capability_tags" {
  type        = list(map(string))
  description = "Capability tags to be applied to the Cloud Zone"
  default     = []
}

variable "tags_to_match" {
  type        = list(map(string))
  description = "Tags to match for filtering clusters"
  default     = []
}

variable "compute_ids" {
  type    = list(string)
  default = []
}

variable "folder" {
  default     = ""
  description = "The folder relative path to the datacenter where resources are deployed to (only applicable for vSphere cloud zones)"
}

variable "region" {
}

variable "name" {
}

variable "description" {
}

variable "placement_policy" {
  default = "DEFAULT"
}
