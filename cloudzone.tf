data "vra_region" "ca_vsphere_labcomp01"{
    region = module.ca_vsphere_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
}
data "vra_region" "ca_vsphere_labcomp01a"{
    for_each = { for dc in module.ca_vsphere_labcomp01.enabled_regions: dc.id => dc }
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
    region = dc.value.region
}

module cz_labcomp01 {
  source        = "./cloudZone"
  name          = "lab-comp01-cz"
  description   = "Lab Comp01 Datacenter"
  region        =  data.vra_region.ca_vsphere_labcomp01.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}