module "ec2_public_bh" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  # depends_on                  = [aws_key_pair.demokey, module.vpc]
  name                   = "ec2-public-bh"
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.instance_type[0]
  availability_zone      = element(module.vpc.azs, 0)
  subnet_id              = element(module.vpc.public_subnets, 0)
  key_name               = "demo_keypairs"
  vpc_security_group_ids = [module.public_bh_sg.security_group_id]
  # key_name                    = aws_key_pair.demokey.key_name
  associate_public_ip_address = true

  tags = local.common_tags

}
