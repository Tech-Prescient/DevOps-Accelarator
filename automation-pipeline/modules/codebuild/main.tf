resource "aws_codebuild_project" "terraform_codebuild_project" {
  count = length(var.build_projects) 
  name           = "${var.build_projects[count.index]}"
  service_role   = var.role_arn

  

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = var.builder_compute_type
    image                       = var.builder_image
    type                        = var.builder_type
    image_pull_credentials_type = var.builder_image_pull_credentials_type

    environment_variable {
      name  = "S3_Bucket"
      value = var.s3_bucket
      type  = "PLAINTEXT"
    }
    environment_variable {
      name  = "java_version"
      value = var.java_version
      type  = "PLAINTEXT"
    }
    environment_variable {
      name  = "chrome_download_url"
      value = var.chrome_download_url
    }


  }
  logs_config {
    cloudwatch_logs {
      status     = "ENABLED"
    }
  }


  source {
    buildspec       = file(var.buildspec_path) 
    type            = var.source_type      
                    
  }
}




