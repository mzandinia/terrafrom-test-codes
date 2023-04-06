# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "public_bh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "public-bh-sg"
  description = "Allow SSH from everywhere"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Block  
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress Rule - all-all open
  egress_rules = ["all-all"]

  tags = local.common_tags
}
