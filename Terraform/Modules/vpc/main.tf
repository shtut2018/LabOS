resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
 
  tags = {
    name = "Dan.Zaltsman"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet_numbers

  vpc_id = aws_vpc.vpc.id

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)

    tags = {
      name = "Dan.Zaltsman"
      role = "public"
      subnet = "${each.key}-${each.value}"

    }
}



