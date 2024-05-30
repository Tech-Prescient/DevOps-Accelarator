variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
  
}

variable "pipeline_role_arn" {
  description = "IAM role ARN for the CodePipeline"
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
  description = "Name of the codebuild "
  type = string
}

variable "github_repo_name" {
  description = "Name of the github repo "
  type = string
}
variable "github_repo_owner" {
  description = "creator of the action being called"
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
  type = string
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

# Add more variables as needed for your pipeline configuration
