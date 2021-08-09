output cloud_account {
  value = {
    "name" = vra_cloud_account_aws.this.name,
    "id"   = vra_cloud_account_aws.this.id
  }
}
output enabled_regions {
  value = [
    for v in data.vra_cloud_account_aws.this: {
      "name"   = v.region,
      "region_id" = v.region_ids
    }
  ]
}