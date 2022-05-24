data "vra_region" "ca_vsphere_labcomp01"{
    for_each = { for dc in module.ca_vsphere_labcomp01.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
    region = each.value.region
}


locals {
    ca_vsphere_labcomp01_region = data.vra_region.ca_vsphere_labcomp01["lab-comp01"].region
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

