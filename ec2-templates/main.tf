terraform {
 required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0" 
}
provider "aws" {
  region  = "us-east-1"
  shared_credentials_files = ["/.aws/credentials"]
  profile = var.aws-profile
}

resource "aws_instance" "redis" {
  ami           = var.ami
  instance_type = var.instance_size
  tags = {
    Name = var.instance_name
    ProvisionedBy= "Terraform"
  }
  associate_public_ip_address = "false"
  key_name = "terraform_ec2_key"
#   user_data = try("${file(var.init-script)}","")
}
resource "aws_key_pair" "terraform_ec2_key" {
	key_name = "terraform_ec2_key"
	public_key = "${file(var.ssh-key-path)}"
}