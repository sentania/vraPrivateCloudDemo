data "vra_region" "labcomp01"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
}

module cz_labcomp01 {
  source        = "./cloudZone"
  name          = "lab-comp01-cz"
  description   = "Lab Comp01 Datacenter"
  region        =  data.vra_region.labcomp01.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}
data "vra_region" "labcomp02"{
    region = module.ca_labcomp02.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp02.cloud_account.id
}
module cz_labcomp02 {
  source        = "./cloudZone"
  name          = "lab-comp02-cz"
  description   = "Lab Comp02 Datacenter"
  region        =  data.vra_region.labcomp02.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}

