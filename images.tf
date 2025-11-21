module image_mappings {
    source        = "./image_profile"
    for_each = data.vra_region.all
    image_name = "${each.value.name}-mapping"
    image_description = "Lab Image Profile manged by TF"
    image_mappings     = [
    {
      image_name = "ubuntu22",
      template_name = "lab-vcf-wld02 / ubuntu22", //when referencing a content library you must preceed the template name with it
      image_description = "ubuntu 22 Template",
      cloud_config = ""
    },
    {
      image_name = "ubuntu24",
      template_name = "lab-vcf-wld02 / ubuntu24", //when referencing a content library you must preceed the template name with it
      image_description = "ubuntu 24 Template",
      cloud_config = ""
    },
  ]    
    region =  each.value.id
    cloud_account = each.value.cloud_account_id
}
