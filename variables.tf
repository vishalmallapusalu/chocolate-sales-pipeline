variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "lambda_bucket_name" {
  description = "S3 bucket to store Lambda code"
  type        = string
  default     = "chocolate-sales-lambda-code-bucket"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "ChocolateHighValueSales"
}

variable "sqs_queue_name" {
  description = "SQS queue name"
  type        = string
  default     = "chocolate-sales-queue"
}

variable "sns_topic_name" {
  description = "SNS topic name"
  type        = string
  default     = "chocolate-sales-alerts"
}
