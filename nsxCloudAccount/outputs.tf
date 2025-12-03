output "cloud_account" {
  value = {
    "name"     = vra_cloud_account_nsxt.this.name,
    "id"       = vra_cloud_account_nsxt.this.id
    "hostname" = vra_cloud_account_nsxt.this.hostname
  }
}
