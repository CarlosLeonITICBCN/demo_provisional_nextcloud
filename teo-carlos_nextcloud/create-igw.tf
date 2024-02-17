# create-igw.tf
 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    "Owner" = var.owner
    "Name"  = "Lab IGW" 
  }
}

#NAT IGW
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet.id
}

resource "aws_eip" "nat_eip" {
  vpc = true
}
