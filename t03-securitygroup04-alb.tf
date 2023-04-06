# AWS EC2 Security Group Terraform Module
# Security Group for Private Hosts
module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "alb-sg"
  description = "Security Group for application load balancer"
  vpc_id      = module.vpc.vpc_id

  # Ingress Rules & CIDR Block  
  ingress_rules       = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Allow Port 81 from internet"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]

  tags = local.common_tags
}
