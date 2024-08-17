
locals {
  environment = basename(path.cwd)
}
################################################################################
# VPC
################################################################################
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Env     = local.environment
    Name    = "VPC-${var.name}-${local.environment}"
    Owner   = "${var.owner}"
    Project = var.project
  }
}
################################################################################
# Subnets
################################################################################
resource "aws_subnet" "this" {
  for_each          = var.subnet_map
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.sub_cidr
  availability_zone = each.value.zone
  tags = {
    Name    = "Subnet-${each.key}-${local.environment}"
    Env     = local.environment
    Owner   = var.owner
    Project = var.project
  }
}

###############################################
# Data sources 
###############################################
#to fetch availability zones
data "aws_availability_zones" "available" {
  state = "available"
}
