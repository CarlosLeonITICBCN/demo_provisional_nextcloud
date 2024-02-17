#create-rt.tf
 
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
 
  tags = {
    "Owner" = var.owner
    "Name"  = "Public Route table"
  }
 
}

resource "aws_route_table_association" "association_subnet" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}






resource "aws_route_table" "rt-privada" {
  vpc_id = aws_vpc.vpc.id
 
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
 
  tags = {
    "Owner" = var.owner
    "Name"  = "privada Route table"
  }
}


resource "aws_route_table_association" "association_subnet_privada" {
  subnet_id      = aws_subnet.subnet-privada.id
  route_table_id = aws_route_table.rt-privada.id
}




