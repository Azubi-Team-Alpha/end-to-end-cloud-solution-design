terraform {
  backend "s3" {
    bucket         = "dev-cloud-solution-165756947575-us-east-1"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}