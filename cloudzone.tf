module "cloud_zones" {
  source     = "./cloudZone"
  depends_on = [module.cloud_accounts_vsphere]
  for_each   = data.vra_region.all

  name        = "${each.value.name}-cz"
  description = "Cloud zone for ${each.value.name}"
  region      = each.value.id
  tags_to_match = [
    {
      key   = "vcfaCapablity"
      value = "ready"
    }
  ]
  capability_tags = [
    {
      key   = "cloud"
      value = "vsphere"
    }
  ]
}

