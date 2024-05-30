variable "project_name" {
  description = "Name of codebuild project"
  type        = string
}  

variable "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket"
  type        = string
}

variable "codebuild_arn" {
  description = "ARN of the CodeBuild project"
}
variable "codepipeline_arn"{
  description = "ARN of the Codepipeline project"
}
