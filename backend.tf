terraform {
  backend "s3" {
    bucket = "elaria-new-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
