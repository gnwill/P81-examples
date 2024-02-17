resource "aws_subnet" "terraform-subnet" {
  cidr_block        = cidrsubnet(aws_vpc.terraform-vpc.cidr_block, 3, 1)
  vpc_id            = aws_vpc.terraform-vpc.id
  availability_zone = "us-east-1a"
  tags = {
    Name       = var.name
    Owner      = var.owner
    Department = "CS"
    Temp       = "True"
  }

}
