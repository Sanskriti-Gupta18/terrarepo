terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.27"
    }
  }
}
provider "aws" {
  region     = var.region_name
  access_key = var.access_key
  secret_key = var.secret_key
}
 
resource "aws_instance" "webec2" {
  ami               = "ami-0f403e3180720dd7e"
  instance_type          = "t2.micro"
  }
  
  variable "access_key" { }
  variable "secret_Key" { }
  variable "region_name" {
    default = "us-east-1"
  }
