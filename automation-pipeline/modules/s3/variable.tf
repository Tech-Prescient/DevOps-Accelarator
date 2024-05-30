variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "codepipleine-s3-bucket"
}

variable "expiration_days" {
  description = "Number of days before objects expire"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
}