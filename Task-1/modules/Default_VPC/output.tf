
output "vpc_id" {
    value = aws_default_vpc.vpc_default.id
}

output "vpc_cidr_range" {
    value = aws_default_vpc.vpc_default.cidr_block
}