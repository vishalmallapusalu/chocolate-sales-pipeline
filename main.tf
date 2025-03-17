resource "aws_s3_bucket" "chocolate_sales_bucket" {
  bucket = var.lambda_bucket_name
}

resource "aws_dynamodb_table" "chocolate_sales_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "timestamp"

  attribute {
    name = "timestamp"
    type = "S"
  }
}

resource "aws_sqs_queue" "chocolate_sales_queue" {
  name = var.sqs_queue_name
}

resource "aws_sns_topic" "chocolate_sales_alerts" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_subscription" "sqs_subscription" {
  topic_arn = aws_sns_topic.chocolate_sales_alerts.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.chocolate_sales_queue.arn
}
