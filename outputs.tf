output "ansible_instance_public_dns" {
  value = "${aws_instance.my_instance[0].public_dns}"
} 
