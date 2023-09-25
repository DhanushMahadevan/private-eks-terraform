
# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "Private-Route"
  }
}

resource "aws_route_table_association" "a-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "a-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private.id
}


# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks.id

route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
 
  tags = {
    Name = "Public-Route"
  }
}

resource "aws_route_table_association" "a-3" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public.id
}



  


