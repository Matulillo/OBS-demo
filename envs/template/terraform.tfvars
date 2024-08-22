#################
# Input variables
#################

#######################
# tags 
#######################
name    = "obs"
project = "LiveCloud"

#######################
# vpc
####################### 
vpc_create     = false
vpc_cidr_block = "10.100.0.0/16"

########################
# subnets inputs example
########################
/*
subnet_map = {
  "main" = {
    sub_cidr = "10.100.10.0/24"
    zone     = "eu-central-1a"
  }
  "backup" = {
    sub_cidr = "10.100.20.0/24"
    zone     = "eu-central-1b"
  }
}
*/
subnet_map = {}
#########################
# ec2-instances inputs example
#########################
/*
instance_map = {
  "instance1" = {
    ami           = "amazon"
    instance_type = "t2.micro"
    subnet        = "main"
    private_ip    = "10.100.10.10"
  }
  "instance2" = {
    ami           = "ubuntu"
    instance_type = "t2.micro"
    subnet        = "backup"
    private_ip    = "10.100.20.10"
  }
}
*/
instance_map = {}










