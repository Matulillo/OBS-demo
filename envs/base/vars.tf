## Tags
variable "name" {
  description = "name to pass to Name tag"
  default     = "MyName"
}

variable "owner" {
  description = "Owner of Application"
  default     = "MyOwner"
}

variable "project" {
  description = "Owner of Application"
  default     = "MyProject"
}

# Regions and zones
variable "aws_region" {
  description = "AWS region"
  default     = "eu-central-1"
}

# Network variables 
variable "vpc_cidr_block" {
  description = "CIDR IP block VPC"
  default     = "10.0.0.0/16"
}

## subnet attributes 
variable "subnet_map" {
  type = map(object({
    sub_cidr = string
    zone     = string
  }))
  default = null
}
