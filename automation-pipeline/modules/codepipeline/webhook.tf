resource "aws_codepipeline_webhook" "selenium_pipeline" {
  name            = var.webhook_name
  authentication  = "GITHUB_HMAC"
  target_action   = "Source"
  target_pipeline = aws_codepipeline.terraform_codepipline_project.name

  authentication_configuration {
    secret_token = var.github_oauth_token
  }

  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
}
resource "github_repository_webhook" "example" {
  repository = var.github_repo_name
  events     = ["push"]
  active     = true
  configuration {
    url          = aws_codepipeline_webhook.selenium_pipeline.url
    content_type = "json"
    insecure_ssl = false
    secret       = var.github_oauth_token
  }
}