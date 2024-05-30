output "codebuild_arn" {
    description = "The ARN of the CodeBuild project"
    value       = aws_codebuild_project.terraform_codebuild_project[*].arn
  }