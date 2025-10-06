# output "ec2_public_ip" {
#   description = "The public IP address of the EC2 instance"
#   value       = aws_instance.my-instance[*].public_ip 
# }

# output "ec2_private_ip" {
#   description = "The private IP address of the EC2 instance"
#   value       = aws_instance.my-instance[*].private_ip 
# }

output "ec2_public_ip" {
    value = { for key, instance in aws_instance.my-instance : key => instance.public_ip }
}

output "ec2_private_ip" {
    value = { for key, instance in aws_instance.my-instance : key => instance.private_ip }
}