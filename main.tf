# Creating S3 bucket with a unique name
resource "aws_s3_bucket" "mybucket" {
  bucket = "dev-terraform-state-bucket-${random_id.bucket_suffix.hex}"  # Ensures the name is globally unique

  tags = {
    Name = "Dev-bucket"
    env  = "Dev"
  }
}

# Generating a random string to make the S3 bucket name unique
resource "random_id" "bucket_suffix" {
  byte_length = 8
}

# Enabling versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioningexample" {
  bucket = aws_s3_bucket.mybucket.id  # Reference to the 'mybucket' resource
  versioning_configuration {
    status = "Enabled"
  }
}

# Creating DynamoDB table for state locking
resource "aws_dynamodb_table" "locktable" {
  name         = "lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "lock-table"
    env  = "Dev"
  }
}
