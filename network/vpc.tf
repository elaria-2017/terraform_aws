# Creating VPC,name, CIDR and Tags
resource "aws_vpc" "dev" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = var.name
  }
}

# Creating Public Subnets in VPC
resource "aws_subnet" "dev-public-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.public_subnet1_cidr
  #"10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AZ1

  tags = {
    Name = "${var.name}-public-1"
  }
}

resource "aws_subnet" "dev-public-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.public_subnet2_cidr
  #"10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.AZ2

  tags = {
    Name = "${var.name}-public-2"
  }
}

# Creating Private Subnets in VPC
resource "aws_subnet" "dev-private-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.private_subnet1_cidr
  #"10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.AZ1

  tags = {
    Name = "${var.name}-private-1"
  }
}

resource "aws_subnet" "dev-private-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.private_subnet2_cidr 
  #"10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.AZ2

  tags = {
    Name = "${var.name}-private-2"
  }
}


# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "${var.name}-internet-gw"
  }
}

# Creating Route Tables for Internet gateway
resource "aws_route_table" "dev-public" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }

  tags = {
    Name = "${var.name}-public-1"
  }
}

# Creating Route Associations public subnets
resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id      = aws_subnet.dev-public-1.id
  route_table_id = aws_route_table.dev-public.id
}

resource "aws_route_table_association" "dev-public-2-a" {
  subnet_id      = aws_subnet.dev-public-2.id
  route_table_id = aws_route_table.dev-public.id
}