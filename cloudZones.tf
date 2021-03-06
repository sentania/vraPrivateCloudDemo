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

data "vra_region" "vmw_us_east_1" {
  cloud_account_id = module.ca_vmwareaws.cloud_account.id
  region           = "us-east-1"
}

module cz_vmwareaws_us_east_1 {
  source        = "./cloudZone"
  name          = "VMware AWS "
  description   = "VMware AWS US East 1"
  region        =  data.vra_region.vmw_us_east_1.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "aws"
    }
  ]
}