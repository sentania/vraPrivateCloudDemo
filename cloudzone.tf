module "cloud_zones" {
  source     = "./cloudZone"
  depends_on = [module.cloud_accounts_vsphere]
  for_each   = data.vra_region.all

  name        = "${each.value.name}-cz"
  description = "Cloud zone for ${each.value.name}"
  region      = each.value.id

  capability_tags = [
    {
      key   = "cloud"
      value = "vsphere"
    }
  ]
}

