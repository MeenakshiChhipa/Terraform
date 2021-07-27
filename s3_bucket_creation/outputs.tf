output "bucket-name" {
  value = "${var.s3-bucket-name}"

  #value  = aws_s3_bucket.s3-module.bucket
}