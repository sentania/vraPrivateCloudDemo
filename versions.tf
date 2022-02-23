terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
      version = ">= 0.5.0"
    }
    nsxt = {
      source = "vmware/nsxt"
      version = ">= 3.1.0"
    }
    
    vsphere = {
      source = "hashicorp/vsphere"
      version = ">= 1.24.2"
    }
  }
  required_version = ">= 1.0.4"
}
