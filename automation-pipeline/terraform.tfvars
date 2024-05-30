pipeline_name="Automation-Pipeline"
artifact_store_location="codepipleine-s3-bucket"
artifact_store_type="S3"
region= "us-east-1"
codebuild_project_name="codebuild-selenium"
github_repo_name="Seleniumtest"
github_repo_owner="selenium"
github_repo_branch="dev"
github_oauth_token="abdvcsetueshsan"
stages = [
    {
    name             = "SeleniumTests"
    action_name      = "AutomationTest"
    category         = "Build"
    owner            = "AWS"
    provider         = "CodeBuild"
    input_artifacts  = ["source_output"]
    output_artifacts = ["build_output"]
    project_name     = "AutomationTest"
    primary_source   = "source_output"
  }
 ]
 build_projects=["AutomationTest"]
 builder_compute_type="BUILD_GENERAL1_SMALL"
 builder_image="aws/codebuild/amazonlinux2-x86_64-standard:4.0"
 builder_type="LINUX_CONTAINER"
 builder_image_pull_credentials_type="CODEBUILD"
 buildspec_path = "buildspec.yml"
 source_type = "CODEPIPELINE"
 bucket_name= "codepipleine-s3-bucket"
 expiration_days= 30
project_name = "Selenium"
environment = "test"
java_version="corretto17"
chrome_download_url= "https://storage.googleapis.com/chrome-for-testing-public/123.0.6312.86/linux64/chrome-linux64.zip"
source_stage_name="Source"
source_action_name="GitHub"
source_category="Source"
source_owner="ThirdParty"
source_provider="GitHub"
output_artifacts=["source_output"]
webhook_name="selenium-webhook"




