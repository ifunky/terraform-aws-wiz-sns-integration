variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map('BusinessUnit`,`XYZ`)"
}

variable "external_id" {
    type        = string
    description = "Wiz `external id`"
}

variable "lambda_target_arn" {
    type        = string
    description = "SNS Subscription Lambda target ARN"
}

variable "topic_name" {
    type        = string
    description = "SNS topic name"
}

variable "wiz_account_id" {
    type        = string
    description = "Wiz account ID that is allowed to assume the role"
    default     = "197171649850"
}
