
locals {
  environment = basename(path.cwd)
}
################################################################################
# VPC
################################################################################
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name  = "VPC-${var.name}-${local.environment}"
    Owner = "${var.owner}"
    Env   = local.environment
  }
}

resource "aws_subnet" "sub" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = join(".", [substr(var.cidr_block, 0, 5), count.index, "0/24"])
  availability_zone = data.aws_availability_zones.available.names[count.index]
  count             = 2
  tags = {
    Name    = "Subnet-${var.name}-${count.index}-${local.environment}"
    Owner   = var.owner
    Env     = local.environment
    Project = var.project
  }
}
################################################################################
# EC2
################################################################################

resource "aws_instance" "instance" {
  for_each      = var.instance_map
  ami           = each.value.ami
  instance_type = each.value.instance_type
  availability_zone = "${var.aws_region}${each.value.zone}"
  
  tags = {
    Name    = "Server-${each.key}-${local.environment}"
    Owner   = var.owner
    Env     = local.environment
    Project = var.project
  }
}
######################################################################################
# Data sources to fetch availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Data sources to fetch latest AMI
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

