terraform {
  backend "s3" {
    bucket = "elaria-terraform-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}