# Project 1 - Terraform Infrastructure as Code (IaC)

## 📘 Overview
> This project demonstrates the use of **Terraform** to automate infrastructure deployment across **multiple cloud providers** - **Azure** and **AWS**

---

## ☁️ Cloud Infrastructure Deployed

### **Azure**
- Resource Group
- Virtual Network(VNet)
- Virtual Machine (VM)
- Storage Account

### **AWS**
- VPC
- Subnet
- EC2 Instance
- S3 Bucket

---

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
│       ├── terraform.tfstate
│       ├── terraform.tfstate.backup
│       ├── terraform.tfvars
│       └── variables.tf
└── azure
    ├── manual-notes.md
    └── terraform
        ├── main.tf
        ├── outputs.tf
        ├── provider.tf
        ├── terraform.tfstate
        ├── terraform.tfstate.backup
        ├── terraform.tfvars
        └── variables.tf
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
> A fully automated **multi-cloud infrastructure** showcasing strong Terraform fundamentals.


