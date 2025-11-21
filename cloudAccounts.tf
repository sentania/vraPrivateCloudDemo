####ON PREM vSphere Infrastructure
module ca_vsphere_wld02 {
  source = "./vSphereCloudAccount"
  name                = "vcf-lab-vcenter-wld02"
  hostname            = "vcf-lab-vcenter-wld02.int.sentania.net"
  description         = "vcf-lab-wld02-DC"
  password            = var.serviceAccountPassword
  username            = var.serviceAccountUserName
  enabled_datacenters = ["vcf-lab-wld02-dc01","vcf-lab-wld02-dc02"]
  nsxManager          = module.ca_nsx_wld02.cloud_account.id
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
###END vSphere

###NSX Manager
module ca_nsx_wld02{
  source = "./nsxCloudAccount"
  name                = "vcf-lab-nsxmgr-wld02"
  hostname            = "vcf-lab-nsxmgr-wld02.int.sentania.net"
  password            = var.serviceAccountPassword
  username            = var.serviceAccountUserName
  capability_tags     = [
    {
      key   = "cloud",
      value = "vsphere"
    }
  ]
}
##END NSX Manager
