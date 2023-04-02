resource "aws_instance" "my_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    vpc_security_group_ids   =   [aws_security_group.sg_grp.id] # we will create security group sg_grp as well in this script

    provisioner "remote-exec" {
           inline   =   [
               "sudo yum update -y",
               "sudo amazon-linux-extras install java-openjdk11 -y",
               "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
               "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
               "sudo yum install jenkins -y",
               "sudo systemctl start jenkins",
               "sudo yum update -y ",
               "sudo amazon-linux-extras install ansible2 -y",
               "sudo amazon-linux-extras install python3.8 -y",
           ] 
    }
 
    connection {
        type    =   "ssh"
        host    =   self.public_ip
        user    =   "ec2-user"      # default user for Amazon Linux
        private_key =   file("./ec2-key-pair.pem")  # moved key already inti /home.cloudshell-user/SimpliLearn_DevOps_Proj3
    }
    
    tags = {
        name    =   "Jenkins_Ansible_Python_Server"
    }
}
# Creating a new security group with proper rules makes the way easy to connecct ec2 instance after its creation for installing other
# softwares
resource "aws_security_group" "sg_grp" {
    name        =   "sg_grp"
    description =   "Allow inbound traffic"
    
    ingress {
        from_port   =   22
        to_port     =   22
        protocol    =   "tcp"
        cidr_blocks =   ["0.0.0.0/0"]
    }
    
    ingress {
        from_port   =   0
        to_port     =   0
        protocol    =   "-1"
        cidr_blocks =   ["0.0.0.0/0"]
    }
    
    egress  {
        from_port   =   0
        to_port     =   0
        protocol    =   "-1"
        cidr_blocks =   ["0.0.0.0/0"]
    }
    
    tags = {
        name    = "sg_grp"
    }
}
