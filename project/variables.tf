
variable "project_name" {
    type      = string
}
variable "description" {
    type      = string
}
variable "administrators" {
  type        = list(string)
  description = "List of administrator principals for the project"
}
variable "basename" {
    type      = string
}

