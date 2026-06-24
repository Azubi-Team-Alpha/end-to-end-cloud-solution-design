# Generate random password if not provided
resource "random_password" "db_password" {
  count = var.db_password == null ? 1 : 0
  length  = 16
  special = false
}

locals {
  db_password = var.db_password != null ? var.db_password : random_password.db_password[0].result
}

# DB Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

# RDS Instance
resource "aws_db_instance" "this" {
  identifier     = "${var.environment}-postgres"
  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.db_instance_class
  allocated_storage = var.allocated_storage
  storage_encrypted = true

  db_name  = var.db_name
  username = var.db_username
  password = local.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.security_group_ids

  skip_final_snapshot = true  # Set to false in production
  publicly_accessible = false

  tags = {
    Name        = "${var.environment}-rds"
    Environment = var.environment
  }
}

# Store credentials in Secrets Manager
resource "aws_secretsmanager_secret" "db_creds" {
  name = "${var.environment}-db-credentials"

  tags = {
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret_version" "db_creds" {
  secret_id = aws_secretsmanager_secret.db_creds.id
  secret_string = jsonencode({
    dbname     = var.db_name
    username   = var.db_username
    password   = local.db_password
    host       = aws_db_instance.this.address
    port       = aws_db_instance.this.port
    engine     = "postgres"
  })
}