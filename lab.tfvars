nsx_accounts = {
  nsx-wld02 = {
    name                = "vcf-lab-nsxmgr-wld02"
    hostname            = "vcf-lab-nsxmgr-wld02.int.sentania.net"
    capability_tags     = [
    {
        key   = "cloud",
        value = "vsphere"
    }
        ] 
    }
}

vsphere_accounts = {
  vcf-lab-wld02 = {
    name                = "vcf-lab-vcenter-wld02"
    hostname            = "vcf-lab-vcenter-wld02.int.sentania.net"
    description         = "vcf-lab-wld02-DC"
    enabled_datacenters = ["vcf-lab-wld02-dc01", "vcf-lab-wld02-dc02"]
    nsxManager          = "vcf-lab-nsxmgr-wld02"
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
}