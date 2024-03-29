# variables.tf
 
# Variables for general information
######################################
 
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
 
variable "owner" {
  description = "Configuration owner"
  type        = string
}
 
variable "aws_region_az" {
  description = "AWS region availability zone"
  type        = string
  default     = "a"
}
 
 
# Variables for VPC
######################################
 
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
 
variable "vpc_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}
 
variable "vpc_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
 
 
# Variables for Security Group
######################################
 
variable "sg_ingress_proto" {
  description = "Protocol used for the ingress rule"
  type        = string
  default     = "tcp"
}
 
variable "sg_ingress_ssh" {
  description = "Port used for the ingress ssh rule"
  type        = string
  default     = "22"
}
#HTTP
variable "sg_ingress_http" {
  description = "Port used for http"
  type        = string
  default     = "80"
}
#HTTPS
variable "sg_ingress_https" {
  description = "Port used for https"
  type        = string
  default     = "443"
}
#BD sql
variable "sg_ingress_bd_sql" {
  description = "Port used for  sql"
  type        = string
  default     = "3306"
}
variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  type        = string
  default     = "-1"
}
 
variable "sg_egress_all" {
  description = "Port used for the egress rule"
  type        = string
  default     = "0"
}
 
variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
  type        = string
  default     = "0.0.0.0/0"
}
 
variable "sg_ingress_cidr_block" {
  description = "CIDR block for the ingress rule"
  type        = string
  default     = "0.0.0.0/0"
}
 
 
# Variables for Subnet
######################################
 
variable "sbn_public_ip" {
  description = "Assign public IP to the instance launched into the subnet"
  type        = bool
  default     = true
}
 
variable "sbn_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}
 
 
# Variables for Route Table
######################################
 
variable "rt_cidr_block" {
  description = "CIDR block for the route table"
  type        = string
  default     = "0.0.0.0/0"
}
 
 
# Variables for Instance
######################################
 
variable "instance_ami" {
  description = "ID of the AMI used"
  type        = string
  #default     = "ami-0211d10fb4a04824a"
  default     = "ami-0a3c3a20c09d6f377"

}
 
variable "instance_type" {
  description = "Type of the instance"
  type        = string
  #default     = "t2.medium"
  default     = "t2.micro"
}
 
variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "joc-key-pair"
}
 
variable "root_device_type" {
  description = "Type of the root block device"
  type        = string
  default     = "gp2"
}
 
variable "root_device_size" {
  description = "Size of the root block device"
  type        = string
  default     = "50"
}
#Variables for IAM ROLE NAME
#######################################

variable "role_name" {
description= "IAM ROLE"
type = string
default="EMR_EC2_DefaultRole"
}
