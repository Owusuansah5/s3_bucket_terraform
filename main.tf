# Creating S3 bucket with a unique name
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket  # Ensures the name is globally unique

  tags = var.s3_tags
}

# # Generating a random string to make the S3 bucket name unique
# resource "random_id" "bucket_suffix" {
#   byte_length = 8
# }

# Enabling versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioningexample" {
  bucket = aws_s3_bucket.mybucket.id  # Reference to the 'mybucket' resource
  versioning_configuration {
    status = var.versioning_status
  }
}

# Creating DynamoDB table for state locking
resource "aws_dynamodb_table" "locktable" {
  name         = var.name
  billing_mode = var.billing_mode
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.db_tags
}
