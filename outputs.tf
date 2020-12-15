output "recent_amazon_linux_ami_id" {
  value = data.aws_ami.recent_amazon_linux.id
}

output "ec2_instance_eip" {
  value = aws_eip.bastion_ip.public_ip
}
