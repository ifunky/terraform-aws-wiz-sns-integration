output "sns_topic" {
  value       = aws_sns_topic.wiz.arn
  description = "ARN of the SNS topic created"
}
