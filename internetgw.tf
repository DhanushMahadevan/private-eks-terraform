resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "eks-igw"
  }
}