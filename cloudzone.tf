locals {
  cloud_account_regions = flatten([
    for ca_key, ca in module.cloud_accounts_vsphere : [
      for r in ca.cloud_account.enabled_regions : {
        cloud_account_name = ca_key
        cloud_account_id   = ca.cloud_account.id
        region_name        = r.name
        region_id          = r.external_region_id
      }
    ]
  ])
}


module "cloud_zones" {
  source = "./cloudZone"
  for_each = data.vra_region.all

  name          = "${each.value.name}-cz"
  description   = "Cloud zone for ${each.value.name}"
  region        = each.value.id

  capability_tags = [
    {
      key   = "cloud"
      value = "vsphere"
    }
  ]
}

