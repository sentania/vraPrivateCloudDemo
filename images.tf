data "vra_region" "image_region_labcomp01"{
    for_each = { for dc in module.ca_vsphere_labcomp01.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_labcomp01.cloud_account.id
    region = each.value.region
}

data "vra_region" "image_region_labcomp02"{
    for_each = { for dc in module.ca_vsphere_labcomp02.enabled_regions: dc.name => dc }
    cloud_account_id = module.ca_vsphere_labcomp02.cloud_account.id
    region = each.value.region
}


locals {
    img_vsphere_labcomp01_region = data.vra_region.image_region_labcomp01["lab-comp01"].id
    img_vsphere_labcomp02_region = data.vra_region.image_region_labcomp02["lab-comp02"].id
}

module img_labcomp01 {
    source        = "./image_profile"
    image_name = "LabComp01 Image Profile"
    image_description = "Lab Image Profile manged by TF"
    image_mappings     = [
    {
      image_name = "centos8",
      template_name = "lab-comp01 / centos8", //when referencing a content library you must preceed the template name with it
      image_description = "CentOS 8 Template",
      cloud_config = ""
    }
  ]    
    region = local.img_vsphere_labcomp01_region
    cloud_account = module.ca_vsphere_labcomp01.cloud_account.id
}

module img_labcomp02 {
    source        = "./image_profile"
    image_name = "LabComp02 Image Profile"
    image_description = "Lab Image Profile manged by TF"
    image_mappings     = [
    {
      image_name = "centos8",
      template_name = "lab-comp01 / centos8", //when referencing a content library you must preceed the template name with it
      image_description = "CentOS 8 Template",
      cloud_config = ""
    }
 ]
    
    region = local.img_vsphere_labcomp02_region
    cloud_account = module.ca_vsphere_labcomp02.cloud_account.id
}