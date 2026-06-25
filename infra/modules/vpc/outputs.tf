output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "nat_gateway_ids" {
  description = "The IDs of all NAT gateways"
  value       = aws_nat_gateway.this[*].id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private.*.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway"
  value       = length(aws_nat_gateway.this) > 0 ? aws_nat_gateway.this[0].id : null
}
