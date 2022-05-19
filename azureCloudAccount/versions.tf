terraform {
  required_providers {
    vra = {
      source = "vmware/vra"
      version = ">= 0.5.1"
    }
  }
  required_version = ">= 1.19"
}
