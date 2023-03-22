output "ansible_instance_public_dns" {
  value = "${aws_instance.ansible_instance.public_dns}"
} 
