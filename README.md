The Terraform project aimed at creating a bastion host on its own subnet in its own VPC.
Opened 22 port for SSH connection. 
An autoscaling group is created, which always makes sure that 1 EC2 instance is up.
An IAM rule is created, with the help of which a specific elastic IP address can be reassosiated again.
That is, when terminating the bastion host, a new bastion host with the same IP address (!) will be automatically created.
terrafform.tfsate isn't stored locally - the file is send to my s3 bucket.
