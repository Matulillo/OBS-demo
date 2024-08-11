provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["C:\\Users\\NET.IBCSYSADMIN4\\Code\\tf\\credentials"]
}

terraform {
  backend "s3" {
    bucket = "obs-demo-tf-state"
    key    = "base"
    region = "eu-central-1"
  }
}
