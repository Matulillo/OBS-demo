#################
# Input variables
#################

#######################
# tags 
#######################
name    = "OBS"
project = "LiveCloud"

#######################
# vpc
####################### 
vpc_create     = true
vpc_cidr_block = "10.10.0.0/16"

########################
# subnets inputs example
########################
/*
subnet_map = {
  "main" = {
    sub_cidr = "10.10.10.0/24"
    zone     = "eu-central-1a"
  }
  "backup" = {
    sub_cidr = "10.10.20.0/24"
    zone     = "eu-central-1b"
  }
}
*/
#########################
# ec2-instances inputs example
#########################
/*
instance_map = {
  "instance1" = {
    ami           = "amazon"
    instance_type = "t2.micro"
    subnet        = "main"
    private_ip    = "10.10.10.10"
    eip           = true
  }
  "instance2" = {
    ami           = "amazon"
    instance_type = "t2.micro"
    subnet        = "backup"
    private_ip    = null
    eip           = false
  }
}
*/
#########################
# Security group inputs example
#########################
/*
sg_rules = [
    {
      from_port   = 9001
      to_port     = 9001
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
      desc        = "Test SG rule1"
    },
    {
      from_port   = 9002
      to_port     = 9002
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
      desc        = "Test SG rule2"
    }
]
*/









