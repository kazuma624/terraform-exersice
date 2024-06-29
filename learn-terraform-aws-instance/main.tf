terraform {
  cloud {
    organization = "dev-hoda"
    workspaces {
      name = "learn-terraform-aws"
    }
  }

  required_providers {
    aws = {
      # hashicorp/aws は registry.terraform.io/hashicorp/aws の省略形
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08b718e14edad7164"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
