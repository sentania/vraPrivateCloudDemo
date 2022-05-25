data "vra_region" "ca_vsphere_labcomp01"{
    for_each = { for dc in module.ca_vsphere_labcomp01.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
    region = each.value.region
}

data "vra_region" "ca_vsphere_labcomp02"{
    for_each = { for dc in module.ca_vsphere_labcomp02.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_labcomp02.cloud_account.id
    region = each.value.region
}


locals {
    ca_vsphere_labcomp01_region = data.vra_region.ca_vsphere_labcomp01["lab-comp01"].id
    ca_vsphere_labcomp02_region = data.vra_region.ca_vsphere_labcomp02["lab-comp02"].id
}

module cz_labcomp01 {
  source        = "./cloudZone"
  name          = "lab-comp01-cz"
  description   = "Lab Comp01 Datacenter"
  region        =  local.ca_vsphere_labcomp01_region
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}

module cz_labcomp02 {
  source        = "./cloudZone"
  name          = "lab-comp02-cz"
  description   = "Lab Comp02 Datacenter"
  region        =  local.ca_vsphere_labcomp02_region
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}
