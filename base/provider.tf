terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["C:\\Users\\NET.IBCSYSADMIN4\\Code\\tf\\credentials"]
}