terraform {
  required_version = "1.1.7"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.5.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.2.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}