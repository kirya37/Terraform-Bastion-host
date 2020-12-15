variable "region" {
  type        = string
  description = "AWS Region"
  default     = "eu-central-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "ssh_key_pair" {
  type        = string
  description = "SSH key"
  default     = "bastion_SSH_key"
}
