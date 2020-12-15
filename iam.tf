resource "aws_iam_instance_profile" "bastion_iam_profile" {
  name       = "Bastion_IAM_Profile"
  role       = aws_iam_role.bastion_iam_role.name
  depends_on = [aws_iam_role.bastion_iam_role, aws_iam_role_policy.bastion_policy]
}


resource "aws_iam_role" "bastion_iam_role" {
  name               = "Bastion_IAM_Role"
  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
}
POLICY
}

resource "aws_iam_role_policy" "bastion_policy" {
  name       = "Bastion_IAM_Role_Policy"
  role       = aws_iam_role.bastion_iam_role.id
  depends_on = [aws_iam_role.bastion_iam_role]
  policy     = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "VisualEditor0",
              "Effect": "Allow",
              "Action": "ec2:AssociateAddress",
              "Resource": "*"
          }
      ]
}
EOF
}
