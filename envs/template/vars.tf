## Tags
variable "name" {
  description = "Value ti use as tag Name"
  default     = "MyName"
}
variable "project" {
  description = "Value to use as tag Project"
  default     = "MyProject"
}

# Regions and zones
variable "aws_region" {
  description = "AWS region to deploy the resources"
  default     = "eu-central-1"
}

# Network variables 
variable "vpc_create" {
  description = "Enable VPC creation"
  default     = false
}
variable "vpc_cidr_block" {
  description = "CIDR IP block for the VPC"
  default     = "10.0.0.0/16"
}

## subnet attributes 
variable "subnet_map" {
  description = "Map to define subnet configuration"
  type = map(object({
    sub_cidr = string
    zone     = string
  }))
  default = {}
}

## ec2 attibutes 
variable "instance_map" {
  description = "Map to define ec2 configuration"
  type = map(object({
    ami           = string
    instance_type = string
    subnet        = string
    private_ip    = string
    eip           = bool
  }))
  default = {}
}

variable "sg_id" {
  type = string
  default = ""
}

locals {
  environment = basename(path.cwd)
}