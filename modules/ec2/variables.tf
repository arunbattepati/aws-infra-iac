variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
}

variable "instance_count" {
  default = 1
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}
