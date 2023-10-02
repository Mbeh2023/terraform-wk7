module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-mbeh"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
resource "aws_dynamodb_table" "terraform_lock" {
    name = "my-dbtable-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    } 
}
#terraform {
  #backend "s3" {
  #bucket = "my-s3-mbeh"
  #key    = "mbeh/terraform.tfstate"
  #region = "us-east-1"
  #dynamodb_table = "my-dbtable-locks"
  #encrypt = true
 #}
#}
