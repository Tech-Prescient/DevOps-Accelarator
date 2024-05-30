variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "artifact_store_location" {
  description = "Location for storing pipeline artifacts"
  type        = string
}
variable "artifact_store_type"{
  description = "Storage type for the artifacts"
  type        = string
}
variable "region" {
  description = "Region to create this pipleine"
  type        = string
}
variable "codebuild_project_name" {
  description = "unique identifier for the project"  
  type = string
}

variable "github_repo_name" {
  description = "Github repo name"     
  type = string
}
variable "github_repo_owner" {
  description = "Github repo owner name"    
  type = string
}

variable "github_repo_branch" {
  description = "Branch name that needs to be used" 
  type = string
}
variable "github_oauth_token" {
  description = "Your secret access token"  
  type = string
}
variable "stages" {
  description = "A list of stages for the CodePipeline"
  type        = list(object({
    name             = string
    action_name      = string
    category         = string
    owner            = string
    provider         = string
    input_artifacts  = list(string)
    output_artifacts = list(string)
    project_name     = string
    primary_source   = string
  }))
  
}
variable "build_projects" {
  description = "List of Names of the CodeBuild projects to be created"
  type        = list(string)
}
variable "builder_compute_type" {
  description = "Information about the compute resources the build project will use"
  type        = string
}

variable "builder_image" {
  description = "Docker image to use for the build project"
  type        = string
}

variable "builder_type" {
  description = "Type of build environment to use for related builds"
  type        = string
}

variable "builder_image_pull_credentials_type" {
  description = "Type of credentials AWS CodeBuild uses to pull images in your build."
  type        = string
}
variable "buildspec_path" {
  description = "Path to the buildspec.yml file"
  type        = string
}

variable "source_type" {
 description = "Type of repository that contains the source code to be built"
 type = string
  
}
#s3 bucket
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "expiration_days" {
  description = "Number of days before objects expire"
  type        = number
}

#iam-role
variable "project_name" {
  description = "Name of codebuild project"
  type        = string
}
variable "environment" {
    description = "Name of the AWS Environment"
    type = string
  
}
variable "java_version" {
   description = "Java version that is required for selenium test cases"
   type = string
  
}
variable "chrome_download_url" {
  description = "Chrome version that is required for selenium test cases"
  type = string
  
}
variable "source_stage_name" {
  description = "Name of the source stage"
  type = string
}

variable "source_action_name" {
  description = "Name of the source action"
  type = string
}

variable "source_category" {
  description = "Category of the source action"
  type =string
}

variable "source_owner" {
  description = "Owner of the source action"
  type = string
}

variable "source_provider" {
  description = "Provider of the source action"
  type = string
}

variable "output_artifacts" {
  description = "List of output artifacts"
  type        = list(string)
}
variable "webhook_name" {
  description = "Codepipeline webhook name"
  type = string
  
}


