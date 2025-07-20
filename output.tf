output "ssh_command" {
  value = "ssh -i ${local_file.sshkey.filename} ec2-user@${aws_instance.ec2.public_ip}"
}