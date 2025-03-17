
output "lambda_kinesis_function_name" {
  description = "Name of Kinesis Lambda Function"
  value       = aws_lambda_function.kinesis_lambda.function_name
}

output "lambda_sqs_function_name" {
  description = "Name of SQS Lambda Function"
  value       = aws_lambda_function.sqs_lambda.function_name
}

output "dynamodb_table_name" {
  description = "DynamoDB Table Name"
  value       = aws_dynamodb_table.chocolate_sales_table.name
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.chocolate_sales_bucket.bucket
}

output "sqs_queue_name" {
  description = "SQS Queue Name"
  value       = aws_sqs_queue.chocolate_sales_queue.name
}

output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = aws_sns_topic.chocolate_sales_alerts.arn
}

