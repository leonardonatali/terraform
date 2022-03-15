terraform {
  required_version = "1.1.7"
  # backend "s3" {
  #   bucket = "terraform"
  #   key    = "terraform.tfstate"
  #   region = "us-east-1"
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
