terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "ansible_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
  
  provisioner "remote-exec" {
    inline = [
    "sudo amazon-linux-extras install ansible2 -y",
    "sudo yum install git -y",
    "git clone https://github.com/devops-school/ansible-hello-world-role /tmp/ans_ws",
    "ansible-playbook /tmp/ans_ws/site.yaml"
    ]
  
    connection {
        # default user for ububtu ami from aws
        # same key as in key_name above
        type           = "ssh" 
        user          = "ubuntu"
        private_key   = "${file(var.private_key_path)}"
        host          = "${self.public_ip}"
    }
  } 
}
