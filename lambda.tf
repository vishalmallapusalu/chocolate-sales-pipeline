# Lambda function for Kinesis Stream
resource "aws_lambda_function" "kinesis_lambda" {
  filename         = "lambda/kinesis_producer.zip"  # ✅ Correct file name
  function_name    = "chocolate_kinesis_lambda"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("lambda/kinesis_producer.zip")

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.chocolate_sales_alerts.arn
    }
  }
}

# Lambda function for SQS Consumer (DynamoDB + S3)
resource "aws_lambda_function" "sqs_lambda" {
  filename         = "lambda/sqs_s3_dynamobd.zip"
  function_name    = "chocolate_sales_sqs_consumer"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("lambda/sqs_s3_dynamobd.zip")

  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.chocolate_sales_table.name  # ✅ Fixed reference
      S3_BUCKET      = aws_s3_bucket.chocolate_sales_bucket.bucket    # ✅ Fixed reference
    }
  }
}
