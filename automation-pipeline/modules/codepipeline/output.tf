output "codepipeline_arn" {
  description = "The ARN of the CodePipeline"
  value       = aws_codepipeline.terraform_codepipline_project.arn
}