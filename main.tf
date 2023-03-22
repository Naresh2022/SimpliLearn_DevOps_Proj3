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
    key_name = aws_key_pair.kp.key_name
  
   
  provisioner "remote-exec" {
    inline = [
    "sudo amazon-linux-extras install ansible2 -y",
    "sudo yum install git -y",
    "git clone https://github.com/Naresh2022/SimpliLearn_DevOps_Proj3",
    "ansible-playbook install_jenkins_java_python.yaml"
    ]
  
    connection {
        # default user for ububtu ami from aws
        # same key as in key_name above
        type           = "ssh" 
        user          = "ec2-user"
        #user          = "ubuntu"
       # private_key   = "${file(var.private_key_path)}"
       # private_key =   local_file.ssh_key.content      
       private_key  = file("~/.ssh/terraform")
        host          = "${self.public_ip}"
    }
  } 
}

#resource "tls_private_key" "pk" {
#  algorithm = "RSA"
#  rsa_bits  = 4096
#}

resource "aws_key_pair" "kp" {
  key_name   = "myAnsibleKey1"   # Create a "myKey" to AWS!!
  #public_key = tls_private_key.pk.public_key_openssh
  public_key = file("~/.ssh/terraform.pub")
}

#resource "local_file" "ssh_key" {
#  filename = "${aws_key_pair.kp.key_name}.pem"
#  content = tls_private_key.pk.private_key_pem
#  file_permission = "0400" 
# }
