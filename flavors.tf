data "vra_region" "flavor_region_labcomp01"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
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
    region_id = data.vra_region.flavor_region_labcomp01.id
}

data "vra_region" "flavor_region_labcomp02"{
    region = module.ca_labcomp02.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp02.cloud_account.id
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
    region_id = data.vra_region.flavor_region_labcomp02.id
}

data "vra_region" "flavor_region_aws_us_east1"{
    region = module.cz_vmwareaws_us_east_1.enabled_regions[0].region
    cloud_account_id = module.cz_vmwareaws_us_east_1.cloud_account.id
}
module flv_vmw_us_east_1 {
    source           = "./flavor_profile"
    name = "cz_vmwareaws_us_east_1"
    flavor_mappings     = [
        {
        name   = "Small",
        instance_type  = "t2.small"
        },
              {
        name   = "Standard",
        instance_type  = "t2.medium"
        },        {
        name   = "Large",
        instance_type  = "t2.large"
        }
    ]
    region_id = data.vra_region.flavor_region_aws_us_east1.id
}
