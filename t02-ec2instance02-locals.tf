locals {

  multiple_public_instances = {
    one = {
      instance_type     = var.instance_type[0]
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.public_subnets, 0)
      cidr_blocks       = element(module.vpc.public_subnets_cidr_blocks, 0)
      ip                = 4
      root_block_device = [
        {
          encrypted = true
        }
      ]
    }
    two = {
      instance_type     = "t3.small"
      availability_zone = element(module.vpc.azs, 1)
      subnet_id         = element(module.vpc.public_subnets, 1)
      cidr_blocks       = element(module.vpc.public_subnets_cidr_blocks, 1)
      ip                = 4
    }
    three = {
      instance_type     = var.instance_type[0]
      availability_zone = element(module.vpc.azs, 2)
      subnet_id         = element(module.vpc.public_subnets, 2)
      cidr_blocks       = element(module.vpc.public_subnets_cidr_blocks, 2)
      ip                = 4
    }
  }

  multiple_private_instances = {
    one = {
      instance_type     = var.instance_type[0]
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.private_subnets, 0)
      cidr_blocks       = element(module.vpc.private_subnets_cidr_blocks, 0)
      ip                = 4
      # root_block_device = [
      #   {
      #     volume_type = "gp3"
      #     volume_size = 10
      #   }
      # ]
    }
    two = {
      instance_type     = var.instance_type[0]
      availability_zone = element(module.vpc.azs, 1)
      subnet_id         = element(module.vpc.private_subnets, 1)
      cidr_blocks       = element(module.vpc.private_subnets_cidr_blocks, 1)
      ip                = 4
      # root_block_device = [
      #   {
      #     volume_type = "gp3"
      #     volume_size = 10
      #   }
      # ]
    }
    # three = {
    #   instance_type     = var.instance_type[0]
    #   availability_zone = element(module.vpc.azs, 2)
    #   subnet_id         = element(module.vpc.private_subnets, 2)
    #   cidr_blocks       = element(module.vpc.private_subnets_cidr_blocks, 2)
    #   ip                = 4
    #   root_block_device = [
    #     {
    #       volume_type = "gp3"
    #       volume_size = 10
    #     }
    #   ]
    # }
  }
}
