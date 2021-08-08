resource "vra_flavor_profile" "this" {
 name = var.name
   dynamic flavor_mapping  {
    for_each = var.flavor_mappings
    content {
      name   = flavor_mapping.value["name"]
      cpu_count = flavor_mapping.value["cpu_count"]
      memory = flavor_mapping.value["memory"]
    }
   }
  region_id = var.region_id
}
