terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
 ## access_key and Secret_key not required because since we are already inside the Account.
  #access_key = "${var.aws_access_key}"
  #secret_key = "${var.aws_secret_key}"
}

resource "aws_instance" "ansible_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    user_data = <<EOF
    echo "Installing EC2"
    sudo apt install git
    EOF
  
    }
 
