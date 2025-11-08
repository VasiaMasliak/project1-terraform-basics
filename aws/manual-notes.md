> Quick setup guide for configuring **AWS CLI** on Windows, macOS and Linux. 
These notes cover basic CLI installation, cnfiguration, and verification - no admin roles or IAM setup.

# ☁️ AWS CLI Setup
## 🪟 Windows
1. Download the installer from 
    👉  https://aws.amazon.com/cli/
2. Run the `.msi` installer and follow the prompts.
3. Open **Command Prompt** or **PowerShell**, verify installation:
`aws --version`
## 🐧 Linux
<pre>sudo apt install awscli -y
# or 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install</pre>
## 🍎 macOS
<pre>brew install awscli
#or 
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWCLIV2.pkg -target /</pre>

# Configure AWS CLI
```bash 
aws configure
# Promts:
# AWS Access Key ID [None]: <your-access-key>
# AWS Secret Access Key [None]: <your-secret-key>
# Default region name [None]: us-east-1
# Defaul output format [None]: json
```



