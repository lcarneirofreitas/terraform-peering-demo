####################
# storage tfstate s3
####################
terraform {
  backend "s3" {
    bucket = "terrafor-state-collystore"
    key = "terraform/terraform.tfstate"
  }
}
