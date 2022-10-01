locals {
}

data "aws_caller_identity" "default" {}

resource "aws_sns_topic" "wiz" {
  name = var.topic_name
}

resource "aws_sns_topic_policy" "wiz" {
  arn = aws_sns_topic.wiz.arn

  policy = data.aws_iam_policy_document.wiz_sns.json
}

resource "aws_sns_topic_subscription" "wiz" {
  topic_arn = aws_sns_topic.wiz.arn
  protocol  = "lambda"
  endpoint  = var.lambda_target_arn
}

data "aws_iam_policy_document" "wiz_sns" {
  policy_id = "wiz_sns_integration"

  statement {
    sid = "wizsnspublish"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.wiz.arn,
    ]

    actions = [
      "SNS:Publish",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        data.aws_caller_identity.default.id,
      ]
    }
  }
}

data "aws_iam_policy_document" "wiz_sns_publish" {
  policy_id = "wiz_sns_publish"

  statement {
    sid = "wizsnspublish"
    effect = "Allow"

    resources = [
      aws_sns_topic.wiz.arn,
    ]

    actions = [
      "SNS:Publish",
    ]
  }
}

data "aws_iam_policy_document" "wiz_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    effect = "Allow"

    principals {
      identifiers = [ var.wiz_account_id ]
      type = "AWS"
    }

    condition {
      test = "StringEquals"
      values = [ var.external_id ]
      variable = "sts:ExternalId"
    }

  }
}

resource "aws_iam_policy" "aws_iam_policy" {
  name        = "Wiz-SNS-Publish"
  description = "Wiz publish to SNS policy"

  policy = data.aws_iam_policy_document.wiz_sns_publish.json
}

resource "aws_iam_role_policy_attachment" "wiz_snn" {
  role       = aws_iam_role.wiz.name
  policy_arn = aws_iam_policy.aws_iam_policy.arn
}

resource "aws_iam_role" "wiz" {
  name               = "WizAccess-SNS-integration"
  assume_role_policy = data.aws_iam_policy_document.wiz_assume_role.json  
}

# resource "aws_iam_role_policy_attachment" "wiz" {
#   role       = aws_iam_role.wiz.name
#   policy_arn = 
# }