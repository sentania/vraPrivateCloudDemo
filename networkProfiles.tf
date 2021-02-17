data "vra_region" "network_region"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
    depends_on = [time_sleep.wait_90_seconds]

}
module np_PrivateCloudSandbox {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Sandbox"
    region   = data.vra_region.network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/13ca5070-2464-41ca-96c3-a3464fba3957" //can't find the API to reference this
    logicalrouter =   "/resources/routers/c57d7c13-f25f-41ae-8b9a-8921fdc971a4" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.200.0/24"
    addressMethod = "mixed"
    cidr = "27"
    capability_tags     = [
    {
      key   = "environment",
      value = "sandbox"
    }
  ]
}