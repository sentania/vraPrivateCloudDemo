
resource "vra_project" "this" {
  name                    = var.project_name
  description             = var.description
  shared_resources        = false
  administrators          = var.administrators
  operation_timeout       = 6000
  machine_naming_template = var.basename
  dynamic "zone_assignments" {
    for_each = var.cloud_zone_ids
    content {
      cloud_zone_id = zone_assignments .value
      priority      = 100
    }
  }
}
