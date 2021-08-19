data "vra_region" "labcomp01_image_region"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
}

module img_labcomp01 {
    source        = "./image_profile"
    image_name = "LabComp01 Image Profile"
    image_description = "Lab Image Profile manged by TF"
    image_mappings     = [
    {
      image_name = "centOS7",
      template_name = "lab-comp01-vcenter / centos7Template", //when referencing a content library you must preceed the template name with it
      image_description = "CentOS 7 Template",
      cloud_config = ""
    },
    {
      image_name = "ubuntu18-dhcp",
      template_name = "lab-comp01-vcenter / ubuntu18-dhcp", //when referencing a content library you must preceed the template name with it 
      image_description = "ubuntu18-dhcp",
      cloud_config = ""
    }
  ]
    
    region = data.vra_region.labcomp01_image_region
    cloud_account = module.ca_labcomp01.cloud_account.id
}

data "vra_region" "labcomp02_image_region"{
    region = module.ca_labcomp02.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp02.cloud_account.id
}

module img_labcomp02 {
    source        = "./image_profile"
    image_name = "LabComp02 Image Profile"
    image_description = "Lab Image Profile manged by TF"
    image_mappings     = [
    {
      image_name = "centOS7",
      template_name = "lab-comp02-vcenter / centos7Template", //when referencing a content library you must preceed the template name with it
      image_description = "CentOS 7 Template",
      cloud_config = ""
    },
    {
      image_name = "ubuntu18-dhcp",
      template_name = "lab-comp02-vcenter / ubuntu18-dhcp", //when referencing a content library you must preceed the template name with it 
      image_description = "ubuntu18-dhcp",
      cloud_config = ""
    }
  ]
    
    region = data.vra_region.labcomp02_image_region
    cloud_account = module.ca_labcomp02.cloud_account.id
}