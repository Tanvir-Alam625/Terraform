provider "aws" {

    region = "ap-south-1"
    profile = "Batch-10"
    alias = "Batch-10"
}

data "aws_iam_group" "batch-10" {
    group_name = "Batch-10"
    provider = aws.Batch-10
}


resource "aws_iam_policy" "restricted_ops_batch_10" {
  name = "restricted-ops-policy-batch-10"
  provider = aws.Batch-10
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [

      # 🔐 ACM: Import + Delete
      {
        Effect = "Allow"
        Action = [
          "acm:ImportCertificate",
          "acm:DeleteCertificate",
          "acm:DescribeCertificate",
          "acm:ListCertificates"
        ]
        Resource = "*"
      },

  
      {
        Effect = "Allow"
        Action = [
          "ssm:StartSession",
          "ssm:SendCommand",
          "ssm:DescribeInstanceInformation",
          "ssm:GetCommandInvocation"
        ]
        Resource = "*"
      },

      # 🗄️ Aurora (RDS)
      {
        Effect = "Allow"
        Action = [
          "rds:DescribeDBClusters",
          "rds:DescribeDBInstances",
          "rds:StartDBCluster",
          "rds:StopDBCluster",
          "rds:ModifyDBCluster"
        ]
        Resource = "*"
      },

      # ☸️ EKS Cluster
      {
        Effect = "Allow"
        Action = [
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:AccessKubernetesApi"
        ]
        Resource = "*"
      }

    ]
  })
}

resource "aws_iam_group_policy_attachment" "attach_restricted_ops-batch-10" {
  provider = aws.Batch-10
  group      = data.aws_iam_group.batch-10.group_name
  policy_arn = aws_iam_policy.restricted_ops_batch_10.arn
}


resource "aws_iam_policy" "manage_iam_batch_10" {
  provider    = aws.Batch-10
  name        = "UserManageOwnAccessKeys-batch-10"
  description = "Allow users to manage their own access keys"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowUserToManageOwnAccessKeys",
        Effect = "Allow",
        Action = [
          "iam:CreateAccessKey",
          "iam:ListAccessKeys",
          "iam:DeleteAccessKey",
          "iam:UpdateAccessKey"
        ],
        Resource = "arn:aws:iam::*:user/$${aws:username}"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "attach_manage_iam_batch_10" {
  provider = aws.Batch-10
  group      = data.aws_iam_group.batch-10.group_name
  policy_arn = aws_iam_policy.manage_iam_batch_10.arn
}