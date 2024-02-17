# create-sg.tf
 
 
resource "aws_security_group" "sg" {
  name        = "${var.owner}-sg"
  description = "Allow inbound traffic via SSH"
  vpc_id      = aws_vpc.vpc.id
 
  ingress = [{
    description      = "all traffic"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_ssh
    to_port          = var.sg_ingress_ssh
    cidr_blocks      = [var.sg_ingress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  },
  {
    description      = "ICMP"
    protocol         = "icmp"
    from_port        = -1
    to_port          = -1
    cidr_blocks      = [var.sg_ingress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  },
{
    description      = "HTTP:80"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_http
    to_port          = var.sg_ingress_http
    cidr_blocks      = [var.sg_ingress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  },
{
    description      = "HTTPS:443"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_https
    to_port          = var.sg_ingress_https
    cidr_blocks      = [var.sg_ingress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  },
{
    description      = "BD:SQL"
    protocol         = var.sg_ingress_proto
    from_port        = var.sg_ingress_bd_sql
    to_port          = var.sg_ingress_bd_sql
    cidr_blocks      = [var.sg_ingress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  }
]
 
  egress = [{
    description      = "All traffic"
    protocol         = var.sg_egress_proto
    from_port        = var.sg_egress_all
    to_port          = var.sg_egress_all
    cidr_blocks      = [var.sg_egress_cidr_block]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
 
  }]
 
  tags = {
    "Owner" = var.owner
    "Name"  = "${var.owner}-sg"
  }
}


