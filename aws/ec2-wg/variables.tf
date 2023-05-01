### Change this with a public key on your local machine, for example ~/.ssh/id_rsa.pub

variable "ssh-key" {
  default = <<EOT

#### YOUR ENTIRE SSH PUB KEY SHOULD GO BETWEEN THE EOT

EOT
}

### Your name
variable "name" {
  type = string
  default = "your name"
}

### Your name again
variable "owner" {
  type = string
  default = "your name"
}

variable "accesskey" {
  type = string
  default = "AWS ACCESS KEY"
}

variable "secretkey" {
  type = string
  default = "AWS SECRET KEY"
}

### AWS Region, pick one close to you
variable "region" {
  type = string
  default = "us-east-1"
}




