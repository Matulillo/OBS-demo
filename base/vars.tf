
# EC2 variables
variable "instance_type1" {
  description = "type of EC2 instance to provision."
  default     = "t2.micro"
}

variable "instance_type2" {
  description = "type of EC2 instance to provision."
  default     = "t2.small"
}

## Tags
variable "name" {
  description = "name to pass to Name tag"
  default     = "Provisioned by Terraform"
}

variable "environment" {
  description = "e.g. Dev, Stage, Prod"
  default     = "dev"
}

variable "owner" {
  description = "Owner of Application"
  default     = "AwesomeDev"
}

variable "project" {
  description = "Owner of Application"
  default     = ""
}

# Regions and zones
variable "aws_region" {
  description = "AWS region"
  default     = "eu-central-1"
}

# Network variables 
variable "cidr_block" {
  description = "CIDR IP block VPC"
  default     = "10.0.0.0/16"
}

###############################

variable "instance_map" {
  type = map(object({
    ami           = string
    instance_type = string
    zone     = string
  }))
  default = {}
}

