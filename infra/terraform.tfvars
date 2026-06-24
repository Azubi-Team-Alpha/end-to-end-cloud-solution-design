region = "us-east-1"
environment = "dev"

vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
azs = ["us-east-1a", "us-east-1b"]

app_port = 8080

db_name           = "myappdb"
db_username       = "admin"
# db_password     = "YourStrongPassword"  # optional; leave commented to generate random
db_instance_class = "db.t3.micro"
allocated_storage = 20
engine_version    = "14.6"