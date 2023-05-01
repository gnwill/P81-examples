variable "cidr" {
  type        = string
  default     = "10.222.0.0/16"
}

variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "public" {
  type        = string
  default     = "10.222.0.0/24"
}

variable "vpc_private_subnets" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["10.222.11.0/24", "10.222.12.0/24", "10.222.13.0/24"]
}

variable "availability" {
  type        = string
  default     = "us-east-1a"
}

variable "accesskey" {
  type        = string
  default     = "ACCESS KEY"
}

variable "secretkey" {
  type        = string
  default     = "SECRET KEY"
}

variable "p81_gw" {
  type        = string
  default     = "P81 GW IP"
}

### Change this with a public key on your local machine, for example ~/.ssh/id_rsa.pub

variable "ssh-key" {
  default = <<EOT
### YOUR PUBLIC SSH KEY ~/.ssh/id_rsa.pub
EOT
}

### Your Name
variable "name" {
  type = string
  default = "FIRST LAST"
}

### Your name again
variable "owner" {
  type = string
  default = "FIRST LAST"
}

      
