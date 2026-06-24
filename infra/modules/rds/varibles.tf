variable "environment" {
  description = "The environment for the RDS instance (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "The ID of the VPC where RDS will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to connect to the RDS instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# Engine
variable "db_engine" {
  description = "The database engine (e.g., mysql, postgres)"
  type        = string
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "15.4"
}

variable "db_parameter_group_family" {
  description = "The DB parameter group family (e.g., postgres15, mysql8.0)"
  type        = string
  default     = "postgres15"
}

# Instance
variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "The master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "The port on which the database accepts connections"
  type        = number
  default     = 5432
}

# Storage
variable "allocated_storage" {
  description = "The initial allocated storage in GiB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "The maximum storage in GiB for autoscaling (0 to disable)"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "The storage type (gp2, gp3, io1)"
  type        = string
  default     = "gp3"
}

variable "storage_encrypted" {
  description = "Whether to encrypt the storage at rest"
  type        = bool
  default     = true
}

# Availability & Resilience
variable "multi_az" {
  description = "Whether to enable Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot on deletion"
  type        = bool
  default     = true
}

# Backup & Maintenance
variable "backup_retention_period" {
  description = "Number of days to retain automated backups (0 to disable)"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The daily time range for automated backups (UTC)"
  type        = string
  default     = "03:00-04:00"
}

variable "maintenance_window" {
  description = "The weekly time range for maintenance (UTC)"
  type        = string
  default     = "Mon:04:00-Mon:05:00"
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately or during the next maintenance window"
  type        = bool
  default     = false
}
