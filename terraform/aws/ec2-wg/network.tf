resource "aws_vpc" "terraform-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name       = var.name
    Owner      = var.owner
    Department = "CS"
    Temp       = "True"
  }
}

resource "aws_internet_gateway" "terraform-ig" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name       = var.name
    Owner      = var.owner
    Department = "CS"
    Temp       = "True"
  }

}

resource "aws_route_table" "terraform-rtb" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-ig.id
  }
  tags = {
    Name       = var.name
    Owner      = var.owner
    Department = "CS"
    Temp       = "True"
  }

}
resource "aws_route_table_association" "terraform-rta" {
  subnet_id      = aws_subnet.terraform-subnet.id
  route_table_id = aws_route_table.terraform-rtb.id
}

