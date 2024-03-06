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
  associate_public_ip_address = true
  ami               = "ami-0f403e3180720dd7e"
  instance_type          = "t2.micro"
  key_name = "tf-key-pair"
  }
  
  variable "access_key" { }
  variable "secret_Key" { }
  variable "region_name" {
    default = "us-east-1"
  }

resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tf-key-pair"
}
