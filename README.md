# Project 1 - Terraform Infrastructure as Code (IaC)

## 📘 Overview
> This project demonstrates the use of **Terraform** to automate infrastructure deployment across **multiple cloud providers** - **Azure** and **AWS**

> The Azure implementation has been refactored using a **modular architecture**, following Terraform best practices for reusable and scalable infrastructure design.

---

## ☁️ Cloud Infrastructure Deployed

### **Azure**(Modular Design)
**Root module**
- Provider configuration
- Variable definitions
- Environment configuration
- Module invocation

**Child module:** `compute_stack`

Responsible for provisioning:
- Resource group
- Virtual Network (VNet)
- Subnet
- Network Security Group (NSG)
- Public IP
- Network interface
- Linux Virtual Machine (VM)
- Storage account

### **AWS**
- VPC
- Subnet
- EC2 Instance
- S3 Bucket

---
## ⚙️ CI/CD Pipeline
This project includes a GitHub Actions–based CI/CD pipeline for Terraform automation across AWS and Azure.

The pipeline performs:
- `terraform fmt`
- `terraform validate`
- `terraform plan`
- `Manual apply with approval`
- `Manual destroy with confirmation safeguard`


## 🚧 CI/CD Pipeline Status
The CI/CD pipeline is currently under active development and refinement.

While the core workflow structure is implemented, further improvements are in progress to enhance reliability, remote state management, and multi-cloud consistency.

## ⚙️ Key Terraform Concepts Used
- `Providers:` Separate provider configurations for AWS and Azure within dedicated directories.
- `Variables & tfvars:` Centralized configuration managment using *variables.tf* and *terraform.tfvars*.
- `Outputs:` Exported resource information(e.g. public IPs, names)
- `State managment:` Managed Terraform state files (*terraform.tfstate*).
- `CLI Workflow:` Hands-on usage of *init*, *plan*, *apply*, and *destroy* commands to manage deployments.
- `Documentation:` *manual-notes.md* in each cloud directory records manual steps and reference details.

---

# Project Structure
<pre>├── README.md
├── aws
│   ├── manual-notes.md
│   └── terraform
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── terraform.tfvars
│       └── variables.tf
└── azure
    ├── manual-notes.md
    └── terraform
        ├── main.tf
        ├── outputs.tf
        ├── provider.tf
        ├── terraform.tfvars
        |── variables.tf
        └── modules
            └── compute_stack
                ├── main.tf      
                ├── variables.tf
                └── outputs.tf
</pre>

---

## Deployment Steps

1. Initialise Terraform
```terraform init```

2. Validate configuration
```terraform validate```

3. Format configuration
```terraform fmt```

4. Preview execution plan
```terraform plan```

5. Apply configuration
```terraform apply```

6. Destroy Infrastructure(Cleanup)
```terraform destroy```

## 🧩 Skills Demonstrated
<pre>✅ Multi-Cloud Infrastructure 
✅ Terraform Modules and State Managment
✅ Azure & AWS Resource Provisioning
✅ CLI-based IaC Automation
</pre>

## Tools and Technologies
* Terraform
* Azure Cloud
* Amazon Web Services (AWS)
* Azure CLI / AWS CLI
* GIT & Version Control

## Skills demonstarted
> A fully automated **multi-cloud infrastructure solution** demonstrating:
- Strong Terraform fundamentals
- Modular infrastructure design
- Reusable Azure compute stack
- Production-style IaC structure


