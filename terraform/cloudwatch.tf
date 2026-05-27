resource "aws_cloudwatch_log_group" "lambda_logs" {
  name = "/aws/lambda/file_processor_lambda"
}