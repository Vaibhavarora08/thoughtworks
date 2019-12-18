provider "aws"{
 region = "${var.region}"

}

provider "aws"{
 alias ="route53"
}

