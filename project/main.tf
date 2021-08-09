
resource "vra_project" "this" {

  name        = var.project_name
  description = var.description

  zone_assignments {
    zone_id          = var.zone_id
    priority         = var.priority
    max_instances    = var.max_instances
    cpu_limit        = var.cpu_limit
    memory_limit_mb  = var.memory_limit_mb
    storage_limit_gb = var.storage_limit_gb
  }
  
  shared_resources = true

  administrator_roles = var.administrators

  member_roles = var.users
  operation_timeout = 6000

  machine_naming_template = var.basename
  constraints {
    dynamic  network {
    for_each = var.networkConstraints
    content {
      expression   = network.value["expression"]
      mandatory  = network.value["mandatory"]
    }
   }
  }
  
}
