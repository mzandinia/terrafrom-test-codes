# EC2 
# output "ec2_public_bh_id" {
#   description = "The ID of the instance"
#   value       = module.ec2_public_bh.id
# }

output "ec2_public_bh_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_public_bh.public_ip
}

# output "ec2_public_bh_public_dns" {
#   description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
#   value       = module.ec2_public_bh.public_dns
# }

output "ec2_private_hosts_private_ips" {
  description = "The private IP name assigned to the instance."
  value = [
    for instance in module.ec2_multiple_private : instance["private_ip"]
  ]
}

