
output "default_subnet_id" {
    value = aws_default_subnet.subnet.id
}

output "private_subnet_id" {
    value = aws_subnet.subnet.id
}

output "subnet_cidr_range" {
    value = aws_default_subnet.subnet.cidr_block
}

output "nat_gw_id" {
    value = aws_nat_gateway.nat_gw.id
}

