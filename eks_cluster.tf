resource "aws_eks_cluster" "eks" {
  name     = "redis-cluster"
  role_arn = aws_iam_role.master.arn
  version = "1.27"

  vpc_config {
    subnet_ids = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
    security_group_ids     = [aws_security_group.allow_tls.id]
    endpoint_private_access = true
    endpoint_public_access  = false
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
    
  ]
  

  
  }

  
