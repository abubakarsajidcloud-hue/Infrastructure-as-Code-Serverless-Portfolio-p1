resource "aws_s3_bucket" "input_bucket" {
  bucket = "${var.bucket_name}-input"
}

resource "aws_s3_bucket" "output_bucket" {
  bucket = "${var.bucket_name}-output"
}