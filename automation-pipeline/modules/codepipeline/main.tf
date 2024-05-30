# Define AWS CodePipeline resource

resource "aws_codepipeline" "terraform_codepipline_project" {
  name     = var.pipeline_name
  role_arn = var.pipeline_role_arn

  artifact_store {
    location = var.artifact_store_location
    type     = var.artifact_store_type
  }

  # Define stages
  stage {
    name = var.source_stage_name

    action {
      name             = var.source_action_name
      category         = var.source_category
      owner            = var.source_owner
      provider         = var.source_provider
      version          = "1"
      region           = var.region
      output_artifacts = var.output_artifacts

      configuration = {
        Owner              = var.github_repo_owner
        Repo               = var.github_repo_name
        Branch             = var.github_repo_branch
        OAuthToken         = var.github_oauth_token
      }
    }
  }
  dynamic "stage" {
    for_each = var.stages

    content {
      name = stage.value["name"]

      action {
        name             = stage.value["action_name"]
        category         = stage.value["category"]
        owner            = stage.value["owner"]
        provider         = stage.value["provider"]
        input_artifacts  = stage.value["input_artifacts"]
        output_artifacts = stage.value["output_artifacts"]
        version          = "1"
        run_order        = index(var.stages, stage.value) + 1

        configuration = {
          ProjectName    = stage.value["project_name"]
          PrimarySource  = stage.value["primary_source"]
        }
      }
    }
  }
}

  # Add more stages/actions as needed


