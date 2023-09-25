resource "aws_subnet" "private-subnet-1" {
    availability_zone = "us-west-2a"
    cidr_block = "192.168.0.128/28"
    vpc_id = aws_vpc.eks.id
    map_public_ip_on_launch = false
}

resource "aws_subnet" "private-subnet-2" {
    availability_zone = "us-west-2b"
    cidr_block = "192.168.0.144/28"
    vpc_id = aws_vpc.eks.id
    map_public_ip_on_launch = false
}

resource "aws_subnet" "public-subnet-1" {
    availability_zone = "us-west-2a"
    cidr_block = "192.168.0.0/28"
    vpc_id = aws_vpc.eks.id
    map_public_ip_on_launch = false
}