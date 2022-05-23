terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
      version = ">= 0.3.3"
    }
    vsphere = {
      source = "hashicorp/vsphere"
      version = ">= 1.24.2"
    }
  }
  required_version = ">= 0.13"
}
