####ON PREM vSphere Infrastructure
module ca_vcenter {
  source = "./vSphereCloudAccount"
  name                = "vcenter"
  datacollector       = ""
  hostname            = "vcenter.int.sentania.net"
  password            = var.serviceAccountPassword
  username            = var.serviceAccountUserName
  enabled_datacenters = ["sboweLab"]
  #nsxManager          = module.ca_labcompnsx01.cloud_account.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    },
    {
      key   = "availabilityZone",
      value = "az1"
    }
  ]
}


module ca_labcomp01 {
  source = "./vSphereCloudAccount"
  name                = "lab-comp01"
  datacollector       = ""
  hostname            = "lab-comp01-vcenter.int.sentania.net"
  password            = var.serviceAccountPassword
  username            = var.serviceAccountUserName
  enabled_datacenters = ["lab-comp01"]
  #nsxManager          = module.ca_labcompnsx01.cloud_account.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    },
    {
      key   = "availabilityZone",
      value = "az1"
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
  #nsxManager          = module.ca_labcompnsx01.cloud_account.id
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    },
    {
      key   = "availabilityZone",
      value = "az2"
    }
  ]
}

#module ca_labcompnsx01 {
#  source = "./nsxCloudAccount"
#  name                = "labcompnsx01"
#  datacollector       = ""
#  hostname            = "lab-comp-nsx01.lab.sentania.net"
#  password            = var.serviceAccountPassword
#  username            = var.serviceAccountUserName
#  manager_mode        = true  #manager mode
#  capability_tags     = [
#    {
#      key   = "cloud",
#      value = "vsphere"
#    }
#  ]
#}


###END vSphere
