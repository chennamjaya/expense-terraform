module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  env = var.env
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  azs = var.azs
  default_vpc_id = "vpc-0f85d7a6071a32e51"
  account_no = "851512651356"
}

 
