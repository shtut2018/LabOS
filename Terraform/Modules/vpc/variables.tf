 variable "vpc_cidr" {
   type = string
   default = "10.0.0.0/16"
 }

 variable "public_subnet_numbers" {
   type = map(number)
   default = {
     "us-east-1a" = 1
     "us-east-1b" = 2
     "us-east-1c" = 3
   }
 }

