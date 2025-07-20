data "aws_ami" "al2023" {
    owners = [ "amazon" ]
    most_recent = true
    filter {
      name = "name"
      values = ["al2023-ami-*-x86_64"]
    }
}

resource "aws_instance" "ec2"{
  instance_type = var.instance_type
  ami = data.aws_ami.al2023.id
  vpc_security_group_ids = [ aws_security_group.ec2sg.id ]
  key_name = aws_key_pair.keypair.key_name
  root_block_device {
    volume_size = "30"
    volume_type = "standard"
  }
}