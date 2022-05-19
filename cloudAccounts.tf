####ON PREM vSphere Infrastructure
module ca_vsphere_vcenter {
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


module ca_vsphere_labcomp01 {
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

module ca_vsphere_labcomp02 {
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
###END vSphere

###NSX Manager
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

##END NSX Manager


#AWS Subscription
module ca_vmware_aws{
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

#Azure Subscription
module ca_vmware_azure{
  source = "./azureCloudAccount"
  name = "VMware Azure"
  description = "Azure Subscription provided by VMware"
  subscription_id = var.azure_subscription_id
  tenant_id = var.azure_tenant_id
  application_id = var.azure_application_id
  application_key = var.azure_application_key

  enabled_regions = ["northcentralus"]
  capability_tags = [
    {
      key   = "cloud",
      value = "azure"
    }
  ]
}
#END Azure Subscription