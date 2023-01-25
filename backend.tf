terraform {
  backend "s3" {
    bucket = "tfstate-s3-sdupegui-proj1"
    key    = "dev"
    region = "us-east-1"
    encrypt = true
    kms_key_id = "arn:aws:kms:us-east-1:591024985343:key/b86ed568-e0e4-4a39-a647-5cb2e1a90490"
  }
}
