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

/*
module "demo-network" {
  source = "../../modules/network"
  cidr_block = var.vpc_cidr_block
  subnet_map = var.subnet_map
  name       = var.name
  owner      = var.owner
  project    = var.project
}

output "subnets" {
  value = module.demo-network.subnet_ids
  
}
*/

module "demo-network" {
  source = "../../modules/network"
}