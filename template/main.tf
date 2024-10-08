provider "aws" {
  region                   = "eu-central-1"
  shared_credentials_files = ["C:\\Users\\NET.IBCSYSADMIN4\\Code\\Terraform\\_tools\\credentials"]
}

terraform {
  backend "s3" {
    bucket = "obs-demo-tf-state"
    ## set the key value as the env i.e. dev, uat, stg, prd etc..
    key    = "template"
    region = "eu-central-1"
  }
}

# invoke network module
module "demo-network" {
  source     = "../../modules/network"
  vpc_create = var.vpc_create
  cidr_block = var.vpc_cidr_block
  subnet_map = var.subnet_map
  name       = var.name
  project    = var.project
}

# invoke security group module
module "demo-security-group" {
  source        = "../../modules/security-group"
  vpc_id        = module.demo-network.vpc_id
  ingress_rules = var.sg_rules
  name          = var.name
  project       = var.project
  depends_on    = [module.demo-network]
}

# invoke ec2 module
module "demo-instance" {
  source   = "../../modules/ec2"
  for_each = var.instance_map

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = module.demo-network.subnet_ids["${each.value.subnet}-${local.environment}"]
  private_ip    = each.value.private_ip
  eip           = each.value.eip
  vpc_id        = module.demo-network.vpc_id
  name          = each.key
  project       = var.project
  custom_sg     = module.demo-security-group.sg_id
  depends_on    = [module.demo-security-group]
}