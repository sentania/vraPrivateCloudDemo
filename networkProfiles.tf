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
    edgecluster = "/resources/routers/cf3250f3-988d-4709-af77-7d298ebbc26c" //can't find the API to reference this
    logicalrouter = "/resources/routers/4fce496a-4e0f-4deb-ab61-af42bcb996c8" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.200.0/24"
    cidr = "27"
      capability_tags     = [
    {
      key   = "environment",
      value = "sandbox"
    }
  ]
}
module np_PrivateCloudTestPCI {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Test PCI"
    region   = data.vra_region.network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/cf3250f3-988d-4709-af77-7d298ebbc26c" //can't find the API to reference this
    logicalrouter = "/resources/routers/4fce496a-4e0f-4deb-ab61-af42bcb996c8" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.201.0/24"
    cidr = "27"
      capability_tags     = [
    {
      key   = "environment",
      value = "test"
    },
    {
      key   = "compliance",
      value = "pci"
    },
  ]
}
module np_PrivateCloudTestNonPCI {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Test NonPCI"
    region   = data.vra_region.network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/cf3250f3-988d-4709-af77-7d298ebbc26c" //can't find the API to reference this
    logicalrouter = "/resources/routers/4fce496a-4e0f-4deb-ab61-af42bcb996c8" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.202.0/24"
    cidr = "27"
      capability_tags     = [
    {
      key   = "environment",
      value = "test"
    },
    {
      key   = "compliance",
      value = "nonpci"
    },
  ]
}
module np_PrivateCloudProductionPCI {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Production PCI"
    region   = data.vra_region.network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/cf3250f3-988d-4709-af77-7d298ebbc26c" //can't find the API to reference this
    logicalrouter = "/resources/routers/4fce496a-4e0f-4deb-ab61-af42bcb996c8" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.203.0/24"
    cidr = "27"
      capability_tags     = [
    {
      key   = "environment",
      value = "production"
    },
    {
      key   = "compliance",
      value = "pci"
    },
  ]
}
module np_PrivateCloudProductionNonPCI {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Production NonPCI"
    region   = data.vra_region.network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/cf3250f3-988d-4709-af77-7d298ebbc26c" //can't find the API to reference this
    logicalrouter = "/resources/routers/4fce496a-4e0f-4deb-ab61-af42bcb996c8" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.204.0/24"
    cidr = "27"
      capability_tags     = [
    {
      key   = "environment",
      value = "production"
    },
    {
      key   = "compliance",
      value = "nonpci"
    },
  ]
}