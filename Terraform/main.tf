terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.41.0"
    }   
  }
}

terraform {
  backend "s3" {
    bucket         = "danza-proj-bucket-2"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"

    dynamodb_table = "danza-proj-dynamo"
    encrypt        = true
  }
}


provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./Modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "ec2" {
  source = "./Modules/ec2"
  instance_size = "t2.small"
  instance_ami = "ami-0b0dcb5067f052a63"
  instace_root_size = 50
  subnets = keys(module.vpc.vpc_public_subnets)
  security_groups = [module.vpc.security_group_public]

}

