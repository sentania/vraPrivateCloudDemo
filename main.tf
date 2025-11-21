provider "vra" {
  url           = var.vcfa_url
  organization  = "vcf-lab-vm-apps"
  refresh_token = var.vcfa_refresh_token
  insecure      = true
}