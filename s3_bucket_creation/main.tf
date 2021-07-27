resource "aws_s3_bucket" "s3-module" {
  bucket = "${var.s3-bucket-name}"
  acl    = "no"
}