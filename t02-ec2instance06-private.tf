module "ec2_multiple_private" {
  depends_on = [module.vpc]
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "4.3.0"

  for_each = local.multiple_private_instances

  name                   = "private-${each.key}"
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = each.value.instance_type
  availability_zone      = each.value.availability_zone
  subnet_id              = each.value.subnet_id
  private_ip             = tostring(cidrhost(each.value.cidr_blocks, each.value.ip))
  key_name               = "demo_keypairs"
  vpc_security_group_ids = [module.private_hosts_sg.security_group_id]
  user_data              = file("app1-install.sh")

  user_data_replace_on_change = true
  # key_name          = aws_key_pair.demokey.key_name

  enable_volume_tags = false
  root_block_device  = lookup(each.value, "root_block_device", [])

  tags = local.common_tags
}
