variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment tag"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "azs" {
  description = "Availability zones (must match subnet count)"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "app_port" {
  description = "Port on which the application listens"
  type        = number
  default     = 8000
}

variable "ecs_instance_type" {
  description = "EC2 instance type for ECS capacity"
  type        = string
  default     = "t3.small"
}

variable "ecs_desired_capacity" {
  description = "Desired number of ECS container instances"
  type        = number
  default     = 2
}

variable "ecs_min_size" {
  description = "Minimum number of ECS container instances"
  type        = number
  default     = 2
}

variable "ecs_max_size" {
  description = "Maximum number of ECS container instances"
  type        = number
  default     = 4
}

# RDS variables
variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "myappdb"
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
  default     = "appadmin"
}

variable "db_password" {
  description = "Master password for RDS (if not provided, random will be generated)"
  type        = string
  default     = null
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance class for RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Storage size in GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "14.23"
}