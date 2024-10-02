terraform {
  backend "s3" {
    bucket = "DevopsB4"
    key    = "modules-Devopsb4.tfstate"
    region = "us-east-1"
    # dynamodb_table = "devopsb27-terraform-locking"
    # encrypt        = true
  }
}