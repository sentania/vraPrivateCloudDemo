provider "vra" {
  url           = var.url
  refresh_token = var.refresh_token
  insecure      = var.insecure
}

/*
Note that you can also use the environment variables VRA_REFRESH_TOKEN and VRA_URL in leiu of the above provider block.
*/

module vsphere_production {
  source = "github.com/grantorchard/module-vra-cloud-account"

  name                = "terraform_module_testing"
  data_collector_name = "foo"
  vcenter_hostname    = "prod-vc.hashicorp.com"
  vcenter_password    = "Hashi123!"
  vcenter_username    = "vsphere_admin@hashicorp.com"
  enabled_datacenters = ["Core"]
  capability_tags     = [
    {
      key   = "platform",
      value = "vsphere"
    },
    {
      key   = "environment",
      value = "production"
    }
  ]
}