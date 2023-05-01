resource "aws_instance" "terraform-ec2" {
  ami                         = "ami-0557a15b87f6559cf" # needs to be correct AMI for your region
  instance_type               = "t2.micro"
  key_name                    = "ssh-key"
  subnet_id                   = aws_subnet.terraform-subnet.id
  vpc_security_group_ids      = ["${aws_security_group.terraform-sg.id}"]
  associate_public_ip_address = true
  count 		      = 3


  tags = {
    Name       = var.name
    Owner      = var.owner
    Department = "CS"
    Temp       = "True"
  }
}

