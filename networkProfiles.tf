data "vra_region" "labcomp01_network_region"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
}

module np_PrivateCloudSandbox_labcomp01 {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Sandbox Labcomp01"
    region   = data.vra_region.labcomp01_network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/2069569e-f49d-457b-b184-1f4bf5d46791" //This is a private API call provisioning/uerp/resources/routers
    logicalrouter =   "/resources/routers/c1db2338-2fd1-4bcb-a4d7-aa13eca826d4" // same here
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

module np_privatecloud_labcomp01 {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Labcomp01"
    region   = data.vra_region.labcomp01_network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/2069569e-f49d-457b-b184-1f4bf5d46791" //This is a private API call provisioning/uerp/resources/routers
    logicalrouter =   "/resources/routers/c1db2338-2fd1-4bcb-a4d7-aa13eca826d4" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.201.0/24"
    addressMethod = "mixed"
    cidr = "27"
    capability_tags     = [
    {
      key   = "environment",
      value = "privatecloud"
    }
  ]
}

data "vra_region" "labcomp02_network_region"{
    region = module.ca_labcomp02.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp02.cloud_account.id
}

module np_PrivateCloudSandbox_labcomp02 {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Sandbox Labcomp02"
    region   = data.vra_region.labcomp02_network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/2069569e-f49d-457b-b184-1f4bf5d46791" //This is a private API call provisioning/uerp/resources/routers
    logicalrouter =   "/resources/routers/c1db2338-2fd1-4bcb-a4d7-aa13eca826d4" // same here
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

module np_privatecloud_labcomp02 {
    source   = "./nsxOnDemandNetworkProfile"
    name     = "Private Cloud Labcomp02"
    region   = data.vra_region.labcomp02_network_region
    tier0_router = "lab-nsx-t0"
    network_domain_name = "lab-tz-ovly"
    edgecluster = "/resources/routers/2069569e-f49d-457b-b184-1f4bf5d46791" //This is a private API call provisioning/uerp/resources/routers
    logicalrouter =   "/resources/routers/c1db2338-2fd1-4bcb-a4d7-aa13eca826d4" // same here
    cloud_account = module.ca_labmgmt01nsx.cloud_account.id
    addressSpace = "10.100.201.0/24"
    addressMethod = "mixed"
    cidr = "27"
    capability_tags     = [
    {
      key   = "environment",
      value = "privatecloud"
    }
  ]
}