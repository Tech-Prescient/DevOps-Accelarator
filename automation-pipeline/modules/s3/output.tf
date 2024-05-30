output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.bucket.bucket
}
output "s3_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "The ARN of the S3 Bucket"
}