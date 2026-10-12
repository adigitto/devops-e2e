terraform {
  backend "s3" {
    bucket       = "adi-tf-state-301356686489-us-west-1-an"
    key          = "devops-e2e/terraform.tfstate"
    region       = "us-west-1"
    profile      = "adi-tf"
    encrypt      = true
    use_lockfile = true
  }
}