resource "aws_instance" "control-plane" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    availability_zone = "us-west-2a"
    associate_public_ip_address = true
    tenancy = "default"
    subnet_id = aws_subnet.public-subnet-1.id
    ebs_optimized = false
    vpc_security_group_ids = [
        aws_security_group.jumpserver-sg.id
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 8
        volume_type = "gp2"
        delete_on_termination = true
    }
    iam_instance_profile = "eks-jump-server-role"
    tags = {
        Name = var.instance_name
    }
}

resource "aws_eks_node_group" "node-grp" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.worker.arn
  subnet_ids      = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
  capacity_type   = "ON_DEMAND"
  disk_size       = "20"
  instance_types  = ["t3.medium"]




  remote_access {
    ec2_ssh_key               = var.key_name
    source_security_group_ids = [aws_security_group.node-group-sg.id]
  }

labels = tomap({ env = "dev" })
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,

  ]
}
