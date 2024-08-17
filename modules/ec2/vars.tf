
## EC2 variables

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

## ec2 attibutes 
variable "instance_map" {
  type = map(object({
    ami           = string
    instance_type = string
    zone          = string
    private_ip    = string
  }))
  default = null
}

