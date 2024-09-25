module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "iam" {
  source = "./modules/iam"
  account_id = var.account_id
}

module "ec2" {
  source         = "./modules/ec2"
  instance_count = 2
  vpc_id         = module.vpc.vpc_id
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  ec2_instance_ids = module.ec2.instance_ids
}
