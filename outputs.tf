# VPC-ID
output "eks_vpc_id" {
  value = aws_vpc.eks.id
}
###################################################################################

# Subnets-ids & zones

# Private-1 Subnet
output "private_subnet_1_id" {
  value = aws_subnet.private-subnet-1.id
}

output "private_subnet_1_availability_zone" {
  value = aws_subnet.private-subnet-1.availability_zone
}

# Private-2 Subnet
output "private_subnet_2_id" {
  value = aws_subnet.private-subnet-2.id
}

output "private_subnet_2_availability_zone" {
  value = aws_subnet.private-subnet-2.availability_zone
}

# Public-1 Subnet
output "public_subnet_1_id" {
  value = aws_subnet.public-subnet-1.id
}

output "public_subnet_1_availability_zone" {
  value = aws_subnet.public-subnet-1.availability_zone
}

#################################################################################

# NatGateway ID
output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

##############################################################################

# InternetGateway ID
output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

##############################################################################
# Control plane 

output "control_plane_instance_id" {
  value = aws_instance.control-plane.id
}

output "control_plane_instance_public_ip" {
  value = aws_instance.control-plane.public_ip
}

output "control_plane_instance_private_ip" {
  value = aws_instance.control-plane.private_ip
}

#################################################################################
# Cluster-info

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_cluster_version" {
  value = aws_eks_cluster.eks.version
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.eks.arn
}

######################################################################################

# NodeGroup-info

output "eks_node_group_name" {
  value = aws_eks_node_group.node-grp.node_group_name
}

output "eks_node_group_arn" {
  value = aws_eks_node_group.node-grp.arn
}

#####################################################################################

# IAM-ROLES INFO

output "master_role_name" {
  value = aws_iam_role.master.name
}

output "worker_role_name" {
  value = aws_iam_role.worker.name
}

output "autoscaler_policy_arn" {
  value = aws_iam_policy.autoscaler.arn
}

#######################################################################################
