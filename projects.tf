module Private_Cloud_Sandbox {
    source           = "./project"
    project_name     = "Private Cloud Sandbox"
    description      = "Private Cloud Sandbox Zone - Provisioned by TF"
    zone_id          = module.cz_labcomp01.cloud_zone.id
    priority         = "0"
    max_instances    = "8"
    cpu_limit        = "64"
    memory_limit_mb  = "262144"
    storage_limit_gb = "1024"
    administrators   = ["vradmins@int.sentania.net","labadmins@int.sentania.net"]
    users            = ["terraform@int.sentania.net"]
    basename         =  "vra$${####}"
    networkConstraints     = [
    {
      expression   = "environment:sandbox",
      mandatory = "true"
    }
    ]
}
module Private_Cloud_Sandbox {
    source           = "./project"
    project_name     = "Private Cloud Sandbox"
    description      = "Private Cloud Sandbox Zone - Provisioned by TF"
    zone_id          = module.cz_labcomp01.cloud_zone.id
    priority         = "0"
    max_instances    = "8"
    cpu_limit        = "64"
    memory_limit_mb  = "262144"
    storage_limit_gb = "1024"
    administrators   = ["vradmins@int.sentania.net","labadmins@int.sentania.net"]
    users            = ["terraform@int.sentania.net"]
    basename         =  "vra$${####}"
}

module Private_Cloud_TestPCI {
    source           = "./project"
    project_name     = "Private Cloud Test PCI"
    description      = "Private Cloud Test PCI Zone - Provisioned by TF"
    zone_id          = module.cz_labcomp01.cloud_zone.id
    priority         = "0"
    max_instances    = "8"
    cpu_limit        = "64"
    memory_limit_mb  = "262144"
    storage_limit_gb = "1024"
    administrators   = ["vradmins@int.sentania.net","labadmins@int.sentania.net"]
    users            = ["terraform@int.sentania.net"]
    basename         =  "vra$${####}"
}

module Private_Cloud_TestNonPCI {
    source           = "./project"
    project_name     = "Private Cloud Test NonPCI"
    description      = "Private Cloud Test NonPCI ZOne - Provisioned by TF"
    zone_id          = module.cz_labcomp01.cloud_zone.id
    priority         = "0"
    max_instances    = "8"
    cpu_limit        = "64"
    memory_limit_mb  = "262144"
    storage_limit_gb = "1024"
    administrators   = ["vradmins@int.sentania.net","labadmins@int.sentania.net"]
    users            = ["terraform@int.sentania.net"]
    basename         =  "vra$${####}"
}

module Private_Cloud_ProductionPCI {
    source           = "./project"
    project_name     = "Private Cloud Production PCI"
    description      = "Private Cloud Production PCI Zone - Provisioned by TF"
    zone_id          = module.cz_labcomp01.cloud_zone.id
    priority         = "0"
    max_instances    = "8"
    cpu_limit        = "64"
    memory_limit_mb  = "262144"
    storage_limit_gb = "1024"
    administrators   = ["vradmins@int.sentania.net","labadmins@int.sentania.net"]
    users            = ["terraform@int.sentania.net"]
    basename         =  "vra$${####}"
}

module Private_Cloud_ProductionNonPCI {
    source           = "./project"
    project_name     = "Private Cloud Production NonPCI"
    description      = "Private Cloud Production NonPCI Zone - Provisioned by TF"
    zone_id          = module.cz_labcomp01.cloud_zone.id
    priority         = "0"
    max_instances    = "8"
    cpu_limit        = "64"
    memory_limit_mb  = "262144"
    storage_limit_gb = "1024"
    administrators   = ["vradmins@int.sentania.net","labadmins@int.sentania.net"]
    users            = ["terraform@int.sentania.net"]
    basename         =  "vra$${####}"
}
