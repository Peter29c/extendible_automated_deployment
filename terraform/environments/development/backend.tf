terraform {
  backend "s3" {
    bucket         = "ead-api-tf-state"
    key            = "development/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "ead-api-tf-locks"
    encrypt        = true
    use_lockfile   = true
  }
}