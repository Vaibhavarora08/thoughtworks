# Setup our aws provider
provider "aws" {
  region      = "${var.region}"
 access_key= "${var.aws_access_key_id}"
 secret_key= "${var.aws_secret_access_key}"
}
