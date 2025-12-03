module "simpleIACblueprint" {

  source = "./blueprint"

  for_each = local.projects_expanded

  projectid      = each.value.project_id
  blueprint_name = "Simple IAC Blueprint"

  content = templatefile("${path.module}/blueprint_templates/simpleIac.tpl.yaml", {
    infra_tag = each.value.infra_tag
  })
}
