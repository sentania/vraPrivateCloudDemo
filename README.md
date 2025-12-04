# vraPrivateCloudDemo

A Terraform project to configure a home‑lab environment for vRealize Automation (vRA 8).

## What is this

This repository provides Terraform configuration to stand up and manage a private‑cloud lab environment backed by vRA 8 or VCF 9 VM Apps. It enables automation of cloud accounts, zones, images, flavors, and blueprint configurations to simplify deployment and reproducibility.

Tested with:

- Terraform v1.3.5  
- vRA Terraform provider v0.3.3  

## Structure

```
.
├── backend.tf          # Terraform backend configuration
├── cloudAccounts.tf    # Cloud account definitions (vSphere, NSX, etc.)
├── cloudzone.tf        # Cloud zone configuration
├── flavors.tf          # VM flavor definitions
├── images.tf           # VM image definitions
├── blueprints.tft      # vRA blueprint definitions
├── main.tf             # Root Terraform file
├── variables.tf        # Input variables
├── versions.tf         # Required providers / terraform version
└── README.md           # This file
```

Directories:

- `blueprint/` — Additional blueprint-related resources (if any)  
- `envs/`, `flavor_profile/`, `image_profile/`, etc. — Profiles for environment / flavor / image configurations  

## Prerequisites

- A working vRA 8 installation (or vRA-compatible environment)  
- Proper credentials / permissions to manage cloud accounts, compute resources, and templates in vRA  
- Terraform v1.3.5 (or compatible)  
- vRA Terraform provider v0.3.3  

## How to Use

1. Clone the repository  
   ```bash
   git clone https://github.com/sentania-labs/vraPrivateCloudDemo.git
   cd vraPrivateCloudDemo
   ```  
2. Review and customize variable values in `variables.tf`, especially credentials, account IDs, cloud zones, etc.  
3. Initialize Terraform  
   ```bash
   terraform init
   ```  
4. Review the Terraform plan  
   ```bash
   terraform plan
   ```  
5. Apply the configuration  
   ```bash
   terraform apply
   ```  
6. After apply completes, your vRA environment should include configured cloud accounts, zones, flavors, images, and blueprints — enabling you to deploy VMs or services via vRA’s self-service catalog.

## Recommended Workflow & Best Practices

- Use a dedicated backend (e.g. remote or state backend) — configured in `backend.tf`  
- Store sensitive credentials securely (not in plaintext in `variables.tf`)  
- Use environment-specific variable overrides (e.g. via `-var-file`) when managing multiple environments  
- Review and validate resources before apply — especially in production or shared environments  

## Use Cases & Motivation

- Automating the setup of a vRA‑backed private cloud lab environment  
- Reproducible infrastructure provisioning via Terraform + vRA  
- Easier experimentation and testing of cloud templates / blueprints without manual steps  

## Known Limitations

- Requires working vRA 8 or VCF 9 VM Apps environment  
- The repo assumes familiarity with vSphere/NSX (or other supported infrastructure) as underlying cloud resources  
- Sensitive data (credentials, secrets) management is left to the user — not handled out-of-the-box  
- Tested only with specific versions: Terraform v1.3.5 and vRA provider v0.3.3  

## Contributing

Feel free to submit issues or pull requests. If you add support for new providers, infrastructure types, or improve automation/workflows — please update this README accordingly.

## License & Disclaimer

This project is provided “as is” for lab/demo purposes. Use at your own risk, especially when working with production infrastructure or sensitive environments.
