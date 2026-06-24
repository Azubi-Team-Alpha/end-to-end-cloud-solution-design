variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Dev Environment"
  type        = string
  default     = "dev" 
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  description = "The availability zones to deploy resources in"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "app_port" {
  description = "The port for the application"
  type        = number
  default     = 8080
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "myappdb"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  default     = null
  sensitive   = true
}

variable "db_instance_class" {
  description = "The instance class for the database"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the database in GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "14.6"
}