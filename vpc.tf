data "aws_availability_zones" "available" {}

resource "aws_eip" "bastion_ip" {
  vpc = true
  tags = {
    Name = "Bastion_IP"
  }
}


resource "aws_vpc" "bastion_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = "Bastion_VPC"
  }
}


resource "aws_internet_gateway" "bastion_igw" {
  vpc_id = aws_vpc.bastion_vpc.id
  tags = {
    Name = "Bastion_IGW"
  }
}


resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.bastion_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.bastion_igw.id
}


resource "aws_subnet" "bastion_public_subnet" {
  vpc_id                  = aws_vpc.bastion_vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Bastion_Public_Subnet"
  }
}
