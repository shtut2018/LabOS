resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    name        = "Dan.Zaltsman"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    name        = "Dan.Zaltsman"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

}

resource "aws_route_table_association" "public" {
  for_each  = aws_subnet.public
  subnet_id = aws_subnet.public[each.key].id
 
  route_table_id = aws_route_table.public.id
}