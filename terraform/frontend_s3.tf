resource "aws_s3_bucket" "frontend" {
  bucket = "${var.bucket_name}-frontend"
}

resource "aws_s3_bucket_website_configuration" "frontend_site" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }
}