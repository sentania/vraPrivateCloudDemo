data "vra_region" "image_region"{
    region = module.ca_labcomp01.enabled_regions[0].region
    cloud_account_id = module.ca_labcomp01.cloud_account.id
}
module img_labcomp01 {
    source           = "./image_profile"
    image_name = "centOS7"
    template_name = "lab-comp01-vcenter / centos7Template" //when referencing a content library you must preceed the template name with it 
    image_description = "CentOS 7 Template"
    cloud_config = "runcmd echo 'Hello'"
    region = data.vra_region.image_region
}