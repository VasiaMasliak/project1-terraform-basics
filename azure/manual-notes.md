> Quick setup guide for configuring **AZURE CLI** on Windows, macOS and Linux. 
These notes cover basic CLI installation, cnfiguration, and verification - no admin roles or IAM setup.

# ☁️ AWS CLI Setup
## 🪟 Windows
1. Download the installer from 
    👉  https://aka.ms/installazurecliwindows
2. Run installer, then verify in PowerShell:
`az version`
## 🐧 Linux
`curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`
## 🍎 macOS
`brew install azure-cli`

# Configure Azure CLI
```bash 
az login
az account list --output table
az account set --subscription "<your-subscription-id>"
```

## ✅ Verify
```bash
az account show
az group list --output table
```



