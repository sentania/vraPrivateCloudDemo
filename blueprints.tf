locals {
  all_project_ids = [
    for _, m in module.projects : m.project.id
  ]
}

module "simpleIACblueprint" {
  source = "./blueprint"

  for_each = {
    for project_id in local.all_project_ids :
    project_id => project_id
  }

  projectid      = each.value
  blueprint_name = "Simple IAC Blueprint"

  content = <<-EOT
  formatVersion: 1
  inputs: {}
  resources:
    Cloud_Machine_1:
      type: Cloud.Machine
      metadata:
        layoutPosition: [0, 0]
      properties:
        image: ubuntu24
        flavor: medium
        networks:
          - network: $${resource.Cloud_Network_1.id}
        storage:
          constraints:
            - tag: storageTier:iscsi

    Cloud_Network_1:
      type: Cloud.NSX.Network
      metadata:
        layoutPosition: [1, 0]
      properties:
        networkType: existing
        constraints:
          - tag: application:hr
  EOT
}
