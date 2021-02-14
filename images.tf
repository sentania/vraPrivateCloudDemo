data "vra_region" "image_region"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
    depends_on = [time_sleep.wait_90_seconds]
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
    
    region = data.vra_region.image_region
    cloud_account = module.ca_labcomp01.cloud_account.id
}
