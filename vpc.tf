resource "aws_vpc" "eks" {
    cidr_block = "192.168.0.0/24"
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        Name = "eks-test-vpc"
    }
}