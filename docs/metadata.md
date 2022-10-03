# Module Specifics

Core Version Constraints:
* `>= 1.0`

Provider Requirements:
* **aws (`hashicorp/aws`):** `~> 4.0`

## Input Variables
* `external_id` (required): Wiz `external id`
* `lambda_target_arn` (required): SNS Subscription Lambda target ARN
* `tags` (default `{}`): Additional tags (e.g. map('BusinessUnit`,`XYZ`)
* `topic_name` (required): SNS topic name
* `wiz_account_id` (default `"197171649850"`): Wiz account ID that is allowed to assume the role

## Output Values
* `sns_topic`: ARN of the SNS topic created

## Managed Resources
* `aws_iam_policy.aws_iam_policy` from `aws`
* `aws_iam_role.wiz` from `aws`
* `aws_iam_role_policy_attachment.wiz_snn` from `aws`
* `aws_sns_topic.wiz` from `aws`
* `aws_sns_topic_policy.wiz` from `aws`
* `aws_sns_topic_subscription.wiz` from `aws`

## Data Resources
* `data.aws_caller_identity.default` from `aws`
* `data.aws_iam_policy_document.wiz_assume_role` from `aws`
* `data.aws_iam_policy_document.wiz_sns` from `aws`
* `data.aws_iam_policy_document.wiz_sns_publish` from `aws`

