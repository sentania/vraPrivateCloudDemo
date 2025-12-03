module "projects" {
  source = "./project"
  for_each = {
    for project in var.projects :
    project.name => project
  }
  project_name   = each.value.name
  description    = each.value.description
  administrators = each.value.administrators
  basename       = each.value.basename
}
