# Private EKS Cluster Architecture
![Diagram](https://fusionauth.io/assets/img/docs/installation-guides/kubernetes/eksctl-architecture.png)

# Terraform AWS Infrastructure

This repository contains Terraform configurations to create an AWS Virtual Private Cloud (VPC) and Private EKS Cluster with the following components:
- VPC
- 2 Private Subnets
- 1 Public Subnet (Jump Server)
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Amazon EKS Cluster
- EKS Node Groups
- IAM Roles

## Prerequisites

Before proceeding, make sure you have the following prerequisites installed and configured:

1. **Terraform**: [Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)

2. **AWS CLI**: [Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

3. **AWS Credentials**: Ensure you have AWS credentials set up, either via `aws configure` or environment variables.

## Steps to Deploy

Follow these steps to deploy the infrastructure:

### Step 1: Clone the Repository

Clone this repository to your local machine using Git:

```
git clone  https:///github.com/DhanushMahadevan/private-eks-terraform.git
```
### Step 2: Change the Directory

```
cd private-eks-terraform
```

### Step 3: Initialize Terraform in the cloned directory:

```
terraform init
```

### Step 4: Customize the Configuration (Optional)
Please edit variables.tf and other relevant files to improve the configuration according to your requirements.

### Step 5: Mention your Access and Security keys inside the provider.tf file, Before applying the Infrastructure (Mandatory)
```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }
}
provider "aws" {
	region = "us-west-2"
	access_key = "place your access key"
	secret_key= "place your secret key"
}

```
### Step 6: Apply the Terraform Configuration

```
terraform plan -out=tfplan
```

```
terraform apply
```
## Happy coding and Deploying !.








