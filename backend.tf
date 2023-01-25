terraform {
  backend "s3" {
    bucket = "tfstate-s3-sdupegui-proj1"
    key    = "dev"
    region = "us-east-1"
    encrypt = true
  }
}
