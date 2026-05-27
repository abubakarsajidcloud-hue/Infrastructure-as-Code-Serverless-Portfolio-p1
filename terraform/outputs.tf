output "api_gateway_url" {
  value = aws_apigatewayv2_api.api.api_endpoint
}

output "frontend_url" {
  value = aws_s3_bucket_website_configuration.frontend_site.website_endpoint
}

output "lambda_name" {
  value = aws_lambda_function.file_processor.function_name
}