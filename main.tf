provider "aws" {
  region = var.region
}

data "aws_ami" "recent_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "template_file" "user_data" {
  template = file("data.tpl")
  vars = {
    static_public_ip = aws_eip.bastion_ip.public_ip
    region_name      = var.region
  }
}
