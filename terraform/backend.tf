terraform {
  backend "s3" {
    bucket         = "ead-api-tf-state"
    key            = "ead-api/terraform.tfstate"
    region         = "us-east-2"
    use_lockfile   = true
    dynamodb_table = "ead-api-tf-locks"
    encrypt        = true
  }
}