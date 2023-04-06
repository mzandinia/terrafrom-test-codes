locals {
  private_ec2_id = [for instance in module.ec2_multiple_private : instance["id"]]
}
