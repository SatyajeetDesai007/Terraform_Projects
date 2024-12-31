terraform {
  backend "s3" {
    bucket = "sd07"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}