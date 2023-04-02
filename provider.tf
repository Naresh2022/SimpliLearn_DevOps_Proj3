terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"   #Download and use version greater than 4.0
    }
  }
}

provider "aws" {
  region  = "us-east-1"
 ## access_key and Secret_key not required because since we are already inside the AWS Account.
  #access_key = "${var.aws_access_key}"
  #secret_key = "${var.aws_secret_key}"
}
