output "vpc_id" {
  value = module.vpc.vpc_id
  description = "The ID of the VPC"
}


output "public_subnet_id" {
  value = module.vpc.public_subnet_ids
  description = "The ID of the public subnets"
}


output "private_subnet_id" {
  value = module.vpc.private_subnet_ids
  description = "The ID of the private subnets"
}


output "alb_security_group_id" {
  value = module.alb.alb_security_group_id
  description = "The ID of the ALB security group"
}


output "rds_security_group_id" {
  value = module.rds.rds_security_group_id
  description = "The ID of the RDS security group"
}


output "ec2_instance_profile_name" {
  value = module.ec2.instance_profile_name
  description = "The name of the EC2 instance profile"
}


output "rds_endpoint" {
  value = module.rds.rds_endpoint
  description = "The endpoint of the RDS instance"
}


output "rds_secret_arn" {
  value = module.rds.rds_secret_arn
  description = "The ARN of the RDS secret in Secrets Manager"
}

# Outputs created