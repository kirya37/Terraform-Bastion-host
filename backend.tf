terraform {
  backend "s3" {
    bucket = "kirya"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}
