terraform {
  backend "s3" {
    bucket = "lawrence.femi.odedina"
    key = "state/terraform.tfstate"
    dynamodb_table = "lawrence-femi"
    region = "us-east-1"
    encrypt = true
  }
}