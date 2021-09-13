

resource "aws_default_subnet" "subnet" {
  availability_zone         = var.availability_zone
  map_public_ip_on_launch   = var.map_public_ip_on_launch
}

resource "aws_subnet" "subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_ip
  availability_zone = var.availability_zone
  tags = var.tags
}

resource "aws_eip" "eip" {
  vpc  = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_default_subnet.subnet.id
  depends_on    = [aws_eip.eip]
}

resource "aws_route_table" "private_rt" {
  vpc_id =var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "Private_Route"
  }
  depends_on = [aws_nat_gateway.nat_gw]
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.private_rt.id
}
