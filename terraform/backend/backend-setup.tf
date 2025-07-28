# backend-setup.tf
provider "aws" {
  region = "us-east-1" # or your preferred region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "secure-devops-terraform-state-nortex" # Name it different
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

