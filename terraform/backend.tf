terraform {
  backend "s3" {
    bucket  = "858207583395-terraform-state"
    key     = "learning_terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }
}
