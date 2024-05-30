
module "s3" {
  source          = "./modules/s3"
  bucket_name     = var.bucket_name
  expiration_days = var.expiration_days
  tags = {
    Project_Name = var.project_name
    Environment  = var.environment
    Region       = var.region
  }
}
module "codebuild" {
  source                              = "./modules/codebuild"
  build_projects                      = var.build_projects
  role_arn                            = module.iam.codebuild_role_arn
  s3_bucket                           = module.s3.bucket_name
  builder_compute_type                = var.builder_compute_type
  builder_image                       = var.builder_image
  builder_type                        = var.builder_type
  builder_image_pull_credentials_type = var.builder_image_pull_credentials_type
  buildspec_path                      = var.buildspec_path
  source_type                         = var.source_type
  java_version                        = var.java_version
  chrome_download_url                 = var.chrome_download_url
}
module "codepipeline" {
  source                  = "./modules/codepipeline"
  region                  = var.region
  pipeline_name           = var.pipeline_name
  pipeline_role_arn       = module.iam.codepipeline_role_arn
  artifact_store_location = var.artifact_store_location
  artifact_store_type     = var.artifact_store_type
  github_repo_owner       = var.github_repo_owner
  github_repo_name        = var.github_repo_name
  github_repo_branch      = var.github_repo_branch
  github_oauth_token      = var.github_oauth_token
  codebuild_project_name  = var.codebuild_project_name
  stages                  = var.stages
  source_provider         = var.source_provider
  source_owner            = var.source_owner
  source_action_name      = var.source_action_name
  source_category         = var.source_category
  output_artifacts        = var.output_artifacts
  source_stage_name       = var.source_stage_name
  webhook_name            = var.webhook_name


}

module "iam" {
  source           = "./modules/iam-role"
  project_name     = var.project_name
  s3_bucket_arn    = module.s3.s3_arn
  codebuild_arn    = module.codebuild.codebuild_arn
  codepipeline_arn = module.codepipeline.codepipeline_arn
}



