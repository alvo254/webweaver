resource "aws_vpc" "webweaver" {
  instance_tenancy = "default"
  cidr_block = var.cidr_block
  enable_dns_hostnames = true

    tags = {
    Name = "${var.project}-${var.env}-public_subnet"
  }
}

data "aws_availability_zones" "available_zones" {}

resource "aws_subnet" "webweaver" {
  vpc_id = aws_vpc.webweaver.id
  map_public_ip_on_launch = true
  cidr_block = var.public_subnet
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name = "${var.project}-${var.env}-public_subnet"
  }
}

resource "aws_internet_gateway" "webweaver" {
  vpc_id = aws_vpc.webweaver.id
    tags = {
    Name = "${var.project}-${var.env}-public_subnet"
  }
}

resource "aws_route_table" "webweaver" {
  vpc_id = aws_vpc.webweaver.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webweaver.id
  }
}

resource "aws_route_table_association" "webweaver" {
  route_table_id = aws_route_table.webweaver.id
  subnet_id = aws_subnet.webweaver.id
}