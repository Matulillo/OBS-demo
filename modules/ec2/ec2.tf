
locals {
  environment = basename(path.cwd)
}
#################################################
# EC2
#################################################

resource "aws_instance" "instance" {
  for_each          = var.instance_map
  ami               = each.value.ami
  instance_type     = each.value.instance_type
  availability_zone = "${var.aws_region}${each.value.zone}"

  tags = {
    Name    = "Server-${each.key}-${local.environment}"
    Owner   = var.owner
    Env     = local.environment
    Project = var.project
  }
}
###############################################
# Data sources 
###############################################

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

