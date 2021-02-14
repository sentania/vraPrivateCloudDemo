data "nsxt_logical_tier0_router" "tier0_router" {
  display_name = var.tier0_router
}

data "vra_network_domain" "networkDomain" {
  filter = "name eq '${var.network_domain_name}' and cloudAccountId eq '${var.cloud_account}'"
}

resource "vra_network_profile" "subnet_isolation" {
  name        = var.name
  description = "On-demand networks are created for outbound and private networks."
  region_id   = var.region.id

  isolation_type               = "SUBNET"
  isolated_network_domain_id   = data.vra_network_domain.networkDomain.id
  isolated_network_cidr_prefix = var.cidr
  isolated_network_domain_cidr = var.addressSpace
  custom_properties ={
      datacenterId = var.region.region
      edgeClusterRouterStateLink =  var.edgecluster 
      tier0LogicalRouterStateLink = var.logicalrouter 
      onDemandNetworkIPAssignmentType = "mixed"
  }

  dynamic tags {
    for_each = var.capability_tags
    content {
      key   = tags.value["key"]
      value = tags.value["value"]
    }
  }
}