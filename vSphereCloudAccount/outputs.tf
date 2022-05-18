output cloud_account {
  value = {
    "name" = vra_cloud_account_vsphere.this.name,
    "id"   = vra_cloud_account_vsphere.this.id
  }
}

output enabled_regions {
  value = [
    for k, v in data.vra_region_to_enable.this: {
      "name"   = v.name,
      "region" = format("Datacenter:%s", v.id)
      #"region_id" = element(vra_cloud_account_vsphere.this.region_ids, index(vra_cloud_account_vsphere.this.regions , format("Datacenter:%s", v.id)))
    }
  ]
}