module Private_Cloud_Sandbox_Simple_blueprint {
    source           = "./blueprint"
    blueprint_name = "Simple Blueprint"
    projectid = module.Private_Cloud_Sandbox.project.id
    content = <<-EOT
    formatVersion: 1
    inputs: {}
    version: 1.1.1
    resources:
      Cloud_Machine_1:
        type: Cloud.Machine
        properties:
          image: CentOS7
          flavor: Small
          networks:
            - network: "$${resource.Cloud_NSX_Network_1.id}"
          customizationSpec: custSpec-CentOS7
          tags:
            - key: protection
              value: bkupnoCred
            - key: operatingSystem
              value: centOS
      Cloud_NSX_Network_1:
        type: Cloud.NSX.Network
        properties:
          networkType: routed
          constraints:
            - tag: "dynamicNetwork:Routed"
  EOT
}
