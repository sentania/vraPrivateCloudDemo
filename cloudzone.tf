data "vra_region" "ca_vsphere_labcomp01"{
    for_each = { for dc in module.ca_vsphere_labcomp01.enabled_regions: dc.region => dc }
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
    region = each.value.region
}


local "labcomp01a-dc" {
    value = matchkeys(values(data.vra_region.ca_vsphere_labcomp01), keys(data.vra_region.ca_vsphere_labcomp01.name),"lab-comp01")

module cz_labcomp01 {
  source        = "./cloudZone"
  name          = "lab-comp01-cz"
  description   = "Lab Comp01 Datacenter"
  region        =  local.labcomp01a-dc.region
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}

