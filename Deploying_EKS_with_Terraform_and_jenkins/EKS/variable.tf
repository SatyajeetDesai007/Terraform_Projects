variable "vpc_cidr" {
  description = "VPC_CIDR"
  type        = string
}

variable "public_subnet" {
  description = "subnet CIDR"
  type        = list(string)
}

variable "private_subnet" {
  description = "subnet CIDR"
  type        = list(string)
}