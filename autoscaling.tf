resource "aws_launch_configuration" "bastion_LC" {
  image_id                    = data.aws_ami.recent_amazon_linux.id
  instance_type               = var.instance_type
  name                        = "launch_configuration-bastion"
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.bastion_iam_profile.name
  key_name                    = var.ssh_key_pair
  security_groups             = [aws_security_group.bastion_secgroup.id]
  user_data                   = data.template_file.user_data.rendered
}


resource "aws_autoscaling_group" "bastion_EC2" {
  desired_capacity     = 1
  max_size             = 1
  min_size             = 1
  name                 = "bastion_autoscaling_group"
  launch_configuration = aws_launch_configuration.bastion_LC.name
  vpc_zone_identifier  = [aws_subnet.bastion_public_subnet.id]
  tags = [
    {
      key                 = "Name",
      value               = "Bastion_Server",
      propagate_at_launch = true
    }
  ]
}
