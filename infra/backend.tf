terraform {
  backend "s3" {
    bucket = "dennis-556655"
    region = "us-east-1"
    key    = "docker-repo/terraform.tfstate"
  }
}