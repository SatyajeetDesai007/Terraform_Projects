terraform {
  backend "s3" {
    bucket = "sd07"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}