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

resource "time_sleep" "wait_90_seconds" {
  depends_on = [module.ca_labcomp01]

  create_duration = "90s"
}