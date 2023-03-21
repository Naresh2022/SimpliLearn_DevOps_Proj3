# variable "access_key" {
#        description = "Access key to AWS console"
#}
# variable "secret_key" {
#        description = "Secret key to AWS console"
#}

variable "instance_name" {
        description = "Name of the instance to be created"
        default = "SimpliLearn_DevOps_Proj3_Instance"
}

variable "instance_type" {
        default = "t2.micro"
}

variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-a5a72ce8"
}

variable "ami_id" {
        description = "The AMI to use"
        default = "ami-02f3f602d23f1659d"
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 1
}


variable "ami_key_pair_name" {
        default = "ansible"
}
