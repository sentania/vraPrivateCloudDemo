provider "vra" {
  url           = var.vra_url
  refresh_token = var.refresh_token
  insecure      = var.insecure
}

provider "nsxt" {
  host                  = var.nsx_url
  username              = var.serviceAccountUserName
  password              = var.serviceAccountPassword
  allow_unverified_ssl  = var.insecure
}

