terraform {
  backend "s3" {
    bucket = "kohut-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"

    endpoints = {
      s3 = "https://fra1.digitaloceanspaces.com"
    }


  }
}
