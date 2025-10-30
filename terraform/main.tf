# Create an S3 bucket
data "aws_s3_bucket" "terraform_bucket" {
  bucket = var.terraform_bucket
}


# Upload an object to the bucket
resource "aws_s3_object" "test_file" {
  bucket  = data.aws_s3_bucket.terraform_bucket.id
  key     = "index.html"
  content = "Hello world"

  depends_on = [data.aws_s3_bucket.terraform_bucket]
}

output "object_url" {
  description = "URL of the uploaded object"
  value       = "https://${data.aws_s3_bucket.terraform_bucket.bucket_domain_name}/${aws_s3_object.test_file.key}"
}
