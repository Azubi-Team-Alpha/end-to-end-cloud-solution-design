data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "${var.environment}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy_attachment" "ec2_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.environment}-ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

# ------------------------------------------------------------------------------
# RDS MODULE
# ------------------------------------------------------------------------------
module "rds" {
  source = "../modules/rds"

  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  security_group_ids  = [aws_security_group.rds.id]
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password # optional – module will generate if null
  db_instance_class   = var.db_instance_class
  allocated_storage   = var.allocated_storage
  engine_version      = var.engine_version
  environment         = var.environment
}