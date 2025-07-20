resource "aws_security_group" "ec2sg" {
  name = "EC2SG"
  description = "Security group for ec2"
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ssh_inbound" {
  type = "ingress"
  from_port = "22"
  to_port = "22"
  cidr_blocks = [ "0.0.0.0/0" ]
  protocol = "tcp"
  security_group_id = aws_security_group.ec2sg.id
}