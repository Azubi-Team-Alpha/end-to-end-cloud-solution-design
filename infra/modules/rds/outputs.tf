output "db_endpoint" {
  value = "${aws_db_instance.this.address}:${aws_db_instance.this.port}"
}

output "db_address" {
  value = aws_db_instance.this.address
}

output "db_port" {
  value = aws_db_instance.this.port
}

output "db_secret_arn" {
  value = aws_secretsmanager_secret.db_creds.arn
}