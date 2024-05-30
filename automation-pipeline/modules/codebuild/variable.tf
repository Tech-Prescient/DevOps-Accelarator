variable "build_projects" {
  description = "List of Names of the CodeBuild projects to be created"
  type        = list(string)
}

variable "role_arn" {
  description = "Codebuild IAM role arn. "
  type        = string
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
variable "s3_bucket" {
  description = "Name of the s3 bucket where we will store the artifacts"
  type        = string
}
variable "buildspec_path" {
  description = "Path to the buildspec.yml file"
  type        = string
}
variable "source_type" {
  description = "Type of repository that contains the source code to be built"
  type        = string

}
variable "java_version" {
  description = "Java version that is required for selenium test cases"
  type        = string

}
variable "chrome_download_url" {
  description = "Chrome version that is required for selenium test cases"
  type        = string
}
