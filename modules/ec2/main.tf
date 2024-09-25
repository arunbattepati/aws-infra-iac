resource "aws_instance" "web" {
  count = var.instance_count

  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.security_group_id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.id
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}

output "instance_ids" {
  value = aws_instance.web[*].id
}
