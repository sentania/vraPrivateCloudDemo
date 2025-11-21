data "vra_region" "flavor_region_labcomp01"{
    for_each = { for dc in module.ca_vsphere_labcomp01.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
    region = each.value.region
}

data "vra_region" "flavor_region_labcomp02"{
    for_each = { for dc in module.ca_vsphere_labcomp02.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_labcomp02.cloud_account.id
    region = each.value.region
}


locals {
    flv_vsphere_labcomp01_region = data.vra_region.flavor_region_labcomp01["lab-comp01"].id
    flv_vsphere_labcomp02_region = data.vra_region.flavor_region_labcomp02["lab-comp02"].id
}


module flv_labcomp01 {
    source           = "./flavor_profile"
    name = "flv_labcomp01"
    flavor_mappings     = [
        {
        name   = "Small",
        cpu_count = 2
        memory = 2048
        },
              {
        name   = "Standard",
        cpu_count = 3
        memory = 4096
        },        {
        name   = "Large",
        cpu_count = 4
        memory = 6144
        }
    ]
    region_id = local.flv_vsphere_labcomp01_region

}


module flv_labcomp02 {
    source           = "./flavor_profile"
    name = "flv_labcomp02"
    flavor_mappings     = [
        {
        name   = "Small",
        cpu_count = 2
        memory = 2048
        },
              {
        name   = "Standard",
        cpu_count = 3
        memory = 4096
        },        {
        name   = "Large",
        cpu_count = 4
        memory = 6144
        }
    ]
    region_id = local.flv_vsphere_labcomp02_region
}