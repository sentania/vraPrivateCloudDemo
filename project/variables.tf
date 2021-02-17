
variable "zone_id" {}
variable "project_name" {}
variable "priority" {}
variable "max_instances" {}
variable "cpu_limit" {}
variable "memory_limit_mb" {}
variable "storage_limit_gb" {}
variable "description" {}
variable "administrators" {}
variable "users" {}
variable "basename" {}
variable networkConstraints {
  type        = list(map(string))
  description = "Network constraints for the project"
  default = []
}
