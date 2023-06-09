# Access key and Secret key are need if we are connecting the AWS account outside.
# In SimpliLearn , we already inside AWS account hence no need access and secret key

#variable "aws_access_key" {
#        description = "Access key to AWS console"
#}
# variable "aws_secret_key" {
#       description = "Secret key to AWS console"
#}

variable "instance_name" {
        description = "Name of the instance to be created"
        default = "SimpliLearn_DevOps_Proj3_Instance"
}

variable "instance_type" {
        default = "t2.micro"
}

#variable "subnet_id" {
#        description = "The VPC subnet the instance(s) will be created in"
#        default = "subnet-a5a72ce8"
#}

variable "ami_id" {
        description = "Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type"
        default = "ami-04581fbf744a7d11f"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}

 variable "key_name" {
        default = "ec2-key-pair"
}
 variable "private_key_path" { 
        description = "Path of the key file" 
        default =       "./ec2-key-pair.pem"
 }
