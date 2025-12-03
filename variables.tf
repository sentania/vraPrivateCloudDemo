variable "vcfa_url" {
  type = string
}

variable "vcfa_refresh_token" {
  type = string
}

variable "insecure" {
  type    = bool
  default = true
}

variable "serviceAccountUserName" {
  type = string
}

variable "serviceAccountPassword" {
  type = string
}

variable "backend_db_user" {
  type = string
}

variable "backend_db_pass" {
  type = string
}

variable "backend_db_host" {
  type = string
}

variable "backend_db_name" {
  type = string
}