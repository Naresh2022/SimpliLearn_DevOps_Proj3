output "ansible_instance_public_dns" {
  value = "${aws_instance.ansible_instance[0].public_dns}"
} 
