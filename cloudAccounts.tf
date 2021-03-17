/*
Note that you can also use the environment variables VRA_REFRESH_TOKEN and VRA_URL in leiu of the above provider block.
*/

module ca_labcomp01 {
  source = "./vSphereCloudAccount"
  name                = "lab-comp01"
  datacollector       = ""
  hostname            = "lab-comp01-vcenter.int.sentania.net"
  password            = var.serviceAccountPassword
  username            = var.serviceAccountUserName
  enabled_datacenters = ["lab-comp01"]
  nsxManager          = module.ca_labmgmt01nsx.cloud_account.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}

module ca_labcomp02 {
  source = "./vSphereCloudAccount"
  name                = "lab-comp02"
  datacollector       = ""
  hostname            = "lab-comp02-vcenter.int.sentania.net"
  password            = var.serviceAccountPassword
  username            = var.serviceAccountUserName
  enabled_datacenters = ["lab-comp02"]
  nsxManager          = module.ca_labmgmt01nsx.cloud_account.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}

module ca_labmgmt01nsx {
  source = "./nsxCloudAccount"
  name                = "labmgmt01nsx"
  datacollector       = ""
  hostname            = "lab-mgmt01-nsx01.lab.sentania.net"
  password            = var.serviceAccountPassword
  username            = var.serviceAccountUserName
  manager_mode        = true  #manager mode
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}