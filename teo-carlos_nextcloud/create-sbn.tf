#create-sbn.tf
 
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.sbn_cidr_block
  map_public_ip_on_launch = var.sbn_public_ip
  availability_zone       = "${var.aws_region}${var.aws_region_az}"
 
  tags = {
    "Owner" = var.owner
    "Name"  = "Public Subnet"
  }
}

resource "aws_subnet" "subnet-privada" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.30.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}${var.aws_region_az}"
 
  tags = {
    "Owner" = var.owner
    "Name"  = "Privada sql-nextcloud"
  }
}
