## creates vpn gateway in terraform main vpc
resource "aws_vpn_gateway" "terraform-vpn-gw" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Owner      = var.owner
    Name       = var.name
    Department = "CS"
    Temp       = "True"
  }

}

## creates the customer gateway (P81 Gateway)
resource "aws_customer_gateway" "terraform-customer-gw" {
  bgp_asn    = 65000
  ip_address = var.p81_gw
  type       = "ipsec.1"
  tags = {
    Owner      = var.owner
    Name       = var.name
    Department = "CS"
    Temp       = "True"
  }

}

## creates main vpc
resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.cidr
  tags = {
    Owner      = var.owner
    Name       = var.name
    Department = "CS"
    Temp       = "True"
  }
}

## creates a public subnet
resource "aws_subnet" "terraform-public-subnet" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.public
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = var.availability
  tags = {
    Owner      = var.owner
    Name       = var.name
    Department = "CS"
    Temp       = "True"
  }
}

## creates an internet gateway which will be used for the main vpc
resource "aws_internet_gateway" "terraform-ig" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Owner      = var.owner
    Name       = var.name
    Department = "CS"
    Temp       = "True"
  }

}

## creates a route table for the main vpc, with a default route pointing to the internet gw
resource "aws_route_table" "terraform-routetable" {
  vpc_id = aws_vpc.terraform-vpc.id
  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.terraform-ig.id
  }
  route {
    //route to P81
    cidr_block = "10.250.0.0/16"
    gateway_id = aws_vpn_gateway.terraform-vpn-gw.id
  }

  tags = {
    Owner      = var.owner
    Name       = var.name
    Department = "CS"
    Temp       = "True"
  }

}

## associates the route table and subnet
resource "aws_route_table_association" "terraform-rta" {
  subnet_id      = aws_subnet.terraform-public-subnet.id
  route_table_id = aws_route_table.terraform-routetable.id
  #tags = {
   # Owner      = var.owner
    #Name       = var.name
    #Department = "CS"
    #Temp       = "True"
  #}

}

## creates the vpn gateway attachment with the main vpc
resource "aws_vpn_gateway_attachment" "terraform-vpn-attachment" {
  vpc_id         = aws_vpc.terraform-vpc.id
  vpn_gateway_id = aws_vpn_gateway.terraform-vpn-gw.id
  #tags = {
   # Owner      = var.owner
    #Name       = var.name
    #Department = "CS"
    #Temp       = "True"
  #}

}

resource "aws_vpn_connection" "terraform-vpn" {
  customer_gateway_id = aws_customer_gateway.terraform-customer-gw.id
  vpn_gateway_id      = aws_vpn_gateway.terraform-vpn-gw.id
  type                = aws_customer_gateway.terraform-customer-gw.type
  static_routes_only  = true
  tags = {
    Owner      = var.owner
    Name       = var.name
    Department = "CS"
    Temp       = "True"
  }

}

resource "aws_vpn_connection_route" "terraform-p81" {
  destination_cidr_block = "10.250.0.0/16"
  vpn_connection_id      = aws_vpn_connection.terraform-vpn.id
  #tags = {
   # Owner      = var.owner
   # Name       = var.name
   # Department = "CS"
   # Temp       = "True"
  #}

}
