module "image_mappings" {
  source = "./image_profile"
  depends_on = [module.cloud_accounts_vsphere]
  for_each = {
    for r in local.cloud_account_regions :
    "${r.region_name}-image_mapping" => r
  }

  image_name        = "${each.value.region_name}-mapping"
  image_description = "Lab Image Profile managed by TF"
  image_mappings = each.value.image_mappings

  region        = each.value.region_id
  cloud_account = each.value.cloud_account_id
}
