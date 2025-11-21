data "vra_region" "ca_vsphere_wld02"{
    for_each = { for dc in module.ca_vsphere_wld02.cloud_account.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_wld02.cloud_account.id
    region = each.value.external_region_id
}

module cz_vsphere_wld02 {
  source        = "./cloudZone"
  for_each = data.vra_region.ca_vsphere_wld02
  name          = "${each.key}-cz"
  description   = "Cloud Zone for ${each.key}"
  region        =  each.value.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}
