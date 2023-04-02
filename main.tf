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
  
  provision "file" {
    source  = "/home/cloudshell-user/SimpliLearn_DevOps_Proj3/"
    destination = "/home/ubuntu/SimpliLearn_DevOps_Proj3"
  }
  
    user_data = <<EOF
    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
    sudo apt install git
    #git clone https://github.com/Naresh2022/SimpliLearn_DevOps_Proj3
    ansible-playbook install_jenkins_java_python.yaml
    EOF
  
    }
 
