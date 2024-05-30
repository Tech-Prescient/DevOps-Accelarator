# Define IAM Roles


resource "aws_iam_policy" "codebuild_policy" {
  name = format("%s-codebuild-policy", var.project_name)

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObjectVersion",
        "s3:GetObject",
        "s3:List*",
        "s3:PutObjectAcl"
      ],
      "Resource": "${var.s3_bucket_arn}/*",
      "Sid": "S3Bucketpermissions"
    },
    {
      "Action": [
        "secretsmanager:List*",
        "secretsmanager:Describe*",
        "secretsmanager:Get*"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow",
      "Sid": "SecretManagerReadOnlyPermissions"
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:StartBuild",
        "codebuild:BatchGetBuilds",
        "codebuild:CreateReportGroup",
        "codebuild:CreateReport",
        "codebuild:UpdateReport",
        "codebuild:BatchPutTestCases"
      ],
      "Resource": "${var.codebuild_arn[0]}",
      "Sid": "Codebuildpermissions"
    },
    {
      "Effect": "Allow",
      "Action": [
        "codepipeline:GetPipelineState",
        "codepipeline:PutJobSuccessResult",
        "codepipeline:PutJobFailureResult"
      ],
      "Resource": "${var.codepipeline_arn}",
      "Sid": "Codepipelinepermissions"
    },
    {
      "Effect": "Allow",
       "NotAction": [
            "cloudwatch:Delete*",
            "logs:Delete*"
        ],
      "Resource": [
        "*"
      ],
      "Sid": "Cloudwatchlogs"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "codepipeline_policy" {
  name = format("%s-codepipeline-policy", var.project_name)

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iam:PassRole",
        "codebuild:StartBuild",
        "codebuild:BatchGetBuilds"
      ],
      "Resource": "${var.codebuild_arn[0]}",
      "Sid": "CodebuildPermissions"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObjectVersion",
        "s3:GetObject",
        "s3:List*",
        "s3:PutObjectAcl"
      ],
      "Resource": "${var.s3_bucket_arn}/*",
      "Sid": "S3Bucketpermissions"
    },
    {
      "Action": [
        "secretsmanager:List*",
        "secretsmanager:Describe*",
        "secretsmanager:Get*"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow",
      "Sid": "SecretManagerReadOnlyPermissions"
    },
    {
      "Effect": "Allow",
      "Action": [
        "codepipeline:GetPipelineState",
        "codepipeline:PutJobSuccessResult",
        "codepipeline:PutJobFailureResult",
        "codepipeline:StartPipelineExecution",
        "codepipeline:PutWebhook",
        "codepipeline:DeleteWebhook",
        "codepipeline:RegisterWebhookWithThirdParty",
        "codepipeline:DeregisterWebhookWithThirdParty"
      ],
      "Resource": "${var.codepipeline_arn}",
      "Sid": "Codepipelinepermissions"
    },
    {
      "Effect": "Allow",
      "NotAction": [
        "cloudwatch:Delete*",
        "logs:Delete*"
      ],
      "Resource": [
        "*"
      ],
      "Sid": "Cloudwatchlogs"
    }
  ]
}
EOF
}
resource "aws_iam_role" "codebuild_role" {
  name = format("%s-codebuild-role", var.project_name)

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  })

}
# creating role and attaching the above policy oin
resource "aws_iam_role" "codepipeline_role" {
  name = format("%s-codepipeline-role", var.project_name)

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  })

}
resource "aws_iam_role_policy_attachment" "codebuild_policy_attachment" {
  role       = aws_iam_role.codebuild_role.name
  policy_arn = aws_iam_policy.codebuild_policy.arn
}

resource "aws_iam_role_policy_attachment" "codepipeline_policy_attachment" {
  role       = aws_iam_role.codepipeline_role.name
  policy_arn = aws_iam_policy.codepipeline_policy.arn
}