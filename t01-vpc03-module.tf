# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  # VPC Basic Details
  name            = var.vpc_name
  cidr            = var.vpc_cidr_block
  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  # private_subnet_names = [for sub in module.vpc.public_subnets_cidr_blocks : "private_subnet_${sub}"]

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # VPC NAT Gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  vpc_tags = {
    owners = local.owners
  }

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }

  private_subnet_tags = {
    Type = "Private Subnets"
  }

}
