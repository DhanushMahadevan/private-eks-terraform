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
## Instance Configuration:

## Run AWS Configure Command and put your credentials.
```
 aws configure
```


### Step 1: ALlow 443 port from Jumpserver security to the eks-cluster security (For Accessing the private eks cluster from Jumpserver)

### Step 2: Install Kubectl on Jumpserver
 **KUBECTL**: [Installation Guide](https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html)
 
### Step 3: Edit the .kube/config apiVersion as client.authentication.k8s.io/v1beta1
```
    server: https://02775CCD2DD9D8430DF33D4E655D3799.gr7.us-west-2.eks.amazonaws.com
  name: arn:aws:eks:us-west-2:729136773185:cluster/redis-cluster
contexts:
- context:
    cluster: arn:aws:eks:us-west-2:xxxxxxxxxx5:cluster/redis-cluster
    user: arn:aws:eks:us-west-2:xxxxxxxxxx5:cluster/redis-cluster
  name: arn:aws:eks:us-west-2:xxxxxxxxxx5:cluster/redis-cluster
current-context: arn:aws:eks:us-west-2:xxxxxxxxxx5:cluster/redis-cluster
kind: Config
preferences: {}
users:
- name: arn:aws:eks:us-west-2:xxxxxxxxxx5:cluster/redis-cluster
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      args:
      - --region
      - us-west-2
      - eks
      - get-token
      - --cluster-name
      - redis-cluster
      command: aws
~

```
### step 4: Run the Kubectl commands:
```
kubectl get nodes
```
## Result:
Now you can see the Running Worker Node in EKS Cluster.

# Support and Contribution
For any issues or concerns, please open an issue. Contributions and improvements are welcome; feel free to create a pull request.

# Happy coding and Deploying!.........








