# locals {
#   public_subnets_tag_name = [
#     for sub_ip_range in module.vpc.public_subnets_cidr_blocks : {
#       module.vpc.public_subnet_tags = "public-sub-${sub_ip_range}"
#     }
#   ]
# }
