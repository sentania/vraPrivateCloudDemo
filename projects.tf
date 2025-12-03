module "projects" {
  source = "./project"
  for_each = {
    for project in var.projects :
    project.name => project
  }
  project_name   = project.name
  description    = project.description
  administrators = project.administrators
  basename       = project.basename
}
