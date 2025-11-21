terraform {
  required_version = ">= 1.1.9"
  required_providers {
    vra = {
      source = "vmware/vra"
      version = ">= 0.15.0"
    }
  }
}
