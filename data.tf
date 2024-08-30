data "archive_file" "handler" {
  type = "zip"

  source_dir  = "${path.module}/handler"
  output_path = "${path.module}/handler.zip"
}

resource "aws_s3_object" "lambda_handler" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "handler.zip"
  source = data.archive_file.handler.output_path

  etag = filemd5(data.archive_file.handler.output_path)
}