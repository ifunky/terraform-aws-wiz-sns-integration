

# terraform-aws-wiz-sns-integration
 [![Build Status](https://circleci.com/gh/ifunky/terraform-aws-backend.svg?style=svg)](https://circleci.com/gh/ifunky/terraform-aws-backend-ami) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Wiz allows you to send Issues directly to an SNS topic in AWS which you can then use to create automation flows. This module creates the necessary resources for you to create Wiz actions for your automations.

## Features

### S3 Backend Bucket

- Creates a non public bucket for the Terraform state.  The full bucket name is built by concatenating namespace, environment and bucket name
- Creates an S3 default policy with restricted permissions

## Features

### SNS Topic

- Creates an AWS SNS topic that can be used within Wiz actions
- Creates a subscription to a Lambda function

### IAM Role
- An IAM role is created with the correct permissions for use within Wiz restricted by an external ID



## Usage
```hcl
module "wiz_sns_integration" {
    source = "git::https://github.com/ifunky/terraform-aws-wiz-sns-integration.git?ref=master"

    external_id       = "12345678-f15b-46f0-aa77-d928f254abcd"
    lambda_target_arn = "arn:aws:lambda:us-east-1:123456789012:function:your-function"
    topic_name        = "Wiz-Automation-Test-Flow"
}  

```


## Makefile Targets
The following targets are available: 

```
createdocs/help                Create documentation help
polydev/createdocs             Run PolyDev createdocs directly from your shell
polydev/help                   Help on using PolyDev locally
polydev/init                   Initialise the project
polydev/validate               Validate the code
polydev/wizscan                Security validation
polydev                        Run PolyDev interactive shell to start developing with all the tools or run AWS CLI commands :-)
wizauth                        WizCli authentication
wizscan                        Scan code
```
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
* `sns_topic`

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




## Related Projects

Here are some useful related projects.

- [AWS Lambda Permissions](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html#permissions-resource-serviceinvoke) - Describes how to set Lambda resources permissions





## References

For more information please see the following links of interest: 

- [Wiz SNS Integration](https://docs.wiz.io/wiz-docs/docs/sns-integration) - How to integrate with SNS
- [Wiz Automated Remediation](https://docs.wiz.io/wiz-docs/docs/auto-rem-aws) - Set up Wiz Auto-Remediation

