resource "aws_lambda_function" "file_processor" {
  function_name = "file_processor_lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "handler.lambda_handler"
  runtime       = "python3.11"

  filename         = "../lambda/function.zip"
  source_code_hash = filebase64sha256("../lambda/function.zip")
}