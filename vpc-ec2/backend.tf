terraform {
  required_version = "~> 1.7.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
  }
  backend "s3" {
    bucket         = "jenkins-server-state-file"
    region         = "us-east-1"
    key            = "vpc/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}