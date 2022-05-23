data "vra_region" "ca_vsphere_labcomp01"{
    region = module.ca_vsphere_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
}
data "vra_region" "ca_vsphere_labcomp01a"{
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
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