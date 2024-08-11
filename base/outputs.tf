
output "cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "subnet_ids" {
  value = aws_subnet.sub.*.id
}


