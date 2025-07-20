resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits = "2048"
}

resource "aws_key_pair" "keypair" {
key_name = "test-keypair"
public_key = tls_private_key.keypair.public_key_openssh
}

resource "local_file" "sshkey" {
content = tls_private_key.keypair.private_key_pem
filename = "test-keypair.pem"
}