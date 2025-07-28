
# 📦 Terraform Infrastructure Setup

This Terraform module sets up a secure AWS infrastructure for running a CI/CD pipeline using Jenkins and HashiCorp Vault. It provisions the core infrastructure components needed to securely automate deployments.
🧰 Prerequisites

    ✅ Terraform installed (>= 1.3.x)

    ✅ An AWS account with access keys

    ✅ IAM user with EC2, IAM, VPC, and S3 permissions

    ✅ Git installed

    ✅ Basic knowledge of AWS and Terraform

📁 Terraform Folder Structure

```bash
terraform/
│
├── backend 
│   ├── backend-setup.tf  #Backend SetUp (S3,DyanmoDB) 
│
├── main.tf            # Main resources (VPC, EC2, Security Groups, etc.)
├── variables.tf       # All variable definitions
├── outputs.tf         # Outputs after provisioning
├── provider.tf        # AWS provider setup
└── .gitignore         # To exclude `.terraform` directory and state files
```
⚙️ How It Works

This Terraform setup performs the following:
```bash
Creates a VPC with public/private subnets

Launches a Jenkins EC2 instance in a public subnet

Launches a Vault EC2 instance in a private subnet

Configures Security Groups for restricted access

Sets up IAM roles for Jenkins and Vault EC2 instances

(Optional) Attaches an S3 bucket or secrets backend
```
🚀 How to Use

1. Clone the Repository
```bash
git clone https://github.com/mariusforreal/secure-aws-infra-jenkins-vault.git
cd secure-aws-infra-jenkins-vault/terraform
```
2. Initialize Terraform
```bash
terraform init
```
This will download the required AWS provider and initialize the project.

3. Set Your AWS Credentials

Use one of the following methods:

Option A: Set environment variables:
```bash
export AWS_ACCESS_KEY_ID=your-access-key
export AWS_SECRET_ACCESS_KEY=your-secret-key
```
Option B: Use aws configure (if AWS CLI is installed)
```bash
aws configure
```
4. Plan Your Infrastructure
```bash
terraform plan
```
This shows what Terraform will create or modify.

5. Apply the Configuration
```bash
terraform apply
```
Confirm with yes when prompted.

6. Destroy the Infrastructure (optional)

To tear down everything:
```bash
terraform destroy
```
🔐 Security Notes

- Sensitive values like keys and secrets should not be hardcoded.

- Consider using tools like Terraform Cloud, AWS Secrets Manager, or Vault to manage secrets securely.

- Add .terraform/, terraform.tfstate, and terraform.tfstate.backup to .gitignore to avoid pushing sensitive state data to Git.

📤 Outputs

After successful deployment, you’ll see outputs like:
```bash
Jenkins Public IP

Vault Private IP

IAM role names

VPC ID, Subnet IDs
```
