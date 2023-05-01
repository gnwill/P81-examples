resource "aws_instance" "terraform-ec2" {
  ami             = "ami-0b5eea76982371e91"
  instance_type   = "t2.micro"
  key_name        = "ssh-key"
  subnet_id = "${aws_subnet.terraform-public-subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.terraform-sg.id}"]
  associate_public_ip_address = false


  tags = {
    Name       = "${var.name}-ec2"
    Owner      = var.owner
    Department = "CS"
    Temp       = "True"
  }
}

