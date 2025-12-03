output "cloud_zone" {
  value = {
    "name"      = vra_zone.this.name,
    "id"        = vra_zone.this.id,
    "region_id" = vra_zone.this.region_id
  }
}

