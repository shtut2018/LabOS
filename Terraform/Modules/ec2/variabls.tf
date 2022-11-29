variable instance_size {
    type = string
    description = "ec2 web server size"
    default = "t3.small"
}
 
variable instance_ami {
    type = string
    description = "Server image to use"
}
 
variable instace_root_size {
    type = number
    description = "Root bock device size in GB"
    default = 12
}

variable subnets {
  type = list(string)
  description = "valid subnets to assign to server"
}
 
variable security_groups {
  type = list(string)
  description = "security groups to assign to server"
  default = []
}
