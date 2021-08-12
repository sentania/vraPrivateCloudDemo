####ON PREM vSphere Infrastructure

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
  nsxManager          = module.ca_labmgmt01nsx.cloud_account.id
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


###END vSphere

#AWS Subscription
module ca_vmwareaws{
  source = "./awsCloudAccount"
  name = "VMware AWS"
  description = "AWS Subscription provided by VMware"
  access_key = var.awsAccessKey
  secret_key = var.awsSecretKey
  enabled_regions = ["us-east-1", "us-east-2"]
  capability_tags = [
    {
      key   = "cloud",
      value = "aws"
    }
  ]
}
#END AWS Subscription