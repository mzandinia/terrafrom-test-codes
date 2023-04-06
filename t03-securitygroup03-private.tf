# AWS EC2 Security Group Terraform Module
# Security Group for Private Hosts
module "private_hosts_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "private-hosts-sg"
  description = "Security Group for private instances"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Block  
  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      description = "SSH"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
    {
      rule        = "http-80-tcp"
      description = "HTTP"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]

  tags = local.common_tags
}
