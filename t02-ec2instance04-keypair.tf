# resource "tls_private_key" "generated_demokey" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "demokey" {
#   depends_on = [tls_private_key.generated_demokey]
#   key_name   = "demo_keypairs"

#   public_key = tls_private_key.generated_demokey.public_key_openssh

#   provisioner "local-exec" {
#     command = <<-EOT
#       rm -f ~/.ssh/demo_keypairs.pem
#       echo '${tls_private_key.generated_demokey.private_key_pem}' > ~/.ssh/demo_keypairs.pem
#       chmod 400 ~/.ssh/demo_keypairs.pem
#       EOT
#   }
# }
