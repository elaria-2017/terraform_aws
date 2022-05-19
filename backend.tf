terraform {
  backend "s3" {
    bucket = "elariaa-terraform-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
