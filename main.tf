provider "vra" {
  url           = var.vcfa_url
  organization  = "vcf-lab-vm-apps"
  refresh_token = var.vcfa_refresh_token
  insecure      = true
}

data "vra_region" "all" {
  depends_on = [ module.cloud_accounts_vsphere]
  for_each = {
    for item in local.cloud_account_regions :
    "${item.region_name}" => item
  }

  cloud_account_id = each.value.cloud_account_id
  region           = each.value.region_id
}
