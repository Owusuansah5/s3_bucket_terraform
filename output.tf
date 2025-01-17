output "bucket_name" {
    value = aws_s3_bucket.mybucket.bucket
  
}
output "DynamoDB" {
    value = aws_dynamodb_table.locktable.name
  
}
