terraform {
  backend "s3" {
      region = "us-east-2"
      bucket = "kubernetes-backend"
      encrypt = "true"
      key = "terraform.tfstate"
  }
}