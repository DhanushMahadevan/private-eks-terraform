resource "aws_eks_addon" "coredns_addon" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name                  = "coredns"
  addon_version               = "v1.10.1-eksbuild.4" 
}   

resource "aws_eks_addon" "kube_proxy" {
cluster_name = aws_eks_cluster.eks.name
  addon_name        = "kube-proxy"
  addon_version     = "v1.27.1-eksbuild.1"
}
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name        = "vpc-cni"
  addon_version     = "v1.12.6-eksbuild.2"
}