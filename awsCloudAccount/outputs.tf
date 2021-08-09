output cloud_account {
  value = {
    "name" = vra_cloud_account_aws.this.name,
    "id"   = vra_cloud_account_aws.this.id
  }
}
output enabled_regions {
  value = [
    for k, v in data.aws_regions.this: {
      "name"   = v.name,
      "region" = v.region,
      "region_id" = v.region_ids
    }
  ]
}