output "blueprint" {
  value = {
    "name" = vra_blueprint.this.name,
    "id"   = vra_blueprint.this.id
  }
}