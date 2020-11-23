data "vra_region" "flavor_region"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
}
module flv_labcomp01 {
    source           = "./flavor_profile"
    flavor_mappings     = [
        {
        name   = "Small",
        cpu_count = 2
        memory = 2
        },
              {
        name   = "Medium",
        cpu_count = 3
        memory = 8
        },        {
        name   = "Large",
        cpu_count = 4
        memory = 12
        }
    ]
    region_id = data.vra_region.flavor_region.id
}