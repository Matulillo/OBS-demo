# input variables

name       = "obs"
owner      = "Carlos"
cidr_block = "10.20.0.0/16"
project    = "LiveCloud"


instance_map = {
  "instance1" = {
    ami           = "ami-00060fac2f8c42d30"
    instance_type = "t2.micro"
    zone          = "a"
  }
  "instance2" = {
    ami           = "ami-0e872aee57663ae2d"
    instance_type = "t2.small"
    zone          = "b"
  }
}

#instance_map = {}





