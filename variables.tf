variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
}

variable "external_id" {
    description = "Wiz `external id`"
}

variable "lambda_target_arn" {
    description = "SNS Subscription Lambda target ARN"
}

variable "topic_name" {
    description = "SNS topic name"
}

variable "wiz_account_id" {
    description = "Wiz account ID that is allowed to assume the role"
    default     = "197171649850"
}
