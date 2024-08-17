
output "vpc_cidr_block" {
  value       = aws_vpc.main.cidr_block
  description = "VPC CIDR block"
}

output "subnet_ids" {
  value = { for s in aws_subnet.this : s.tags["Name"] => s.id }
}
/*
output "ec2_ids" {
  value = aws_instance.sub.*.id
}
*/

