data "vra_region" "ca_vsphere_labcomp01"{
    for_each = { for dc in module.ca_vsphere_labcomp01.enabled_regions: dc.region => dc }
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
    region = each.value.region
}

module cz_labcomp01a {
  source        = "./cloudZone"
  name          = lookup(data.vra_region.ca_vsphere_labcomp01.name, "lab-comp01")
  description   = "Lab Comp01 Datacenter"
  region        =  lookup(data.vra_region.ca_vsphere_labcomp01.id, "lab-comp01")
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}

