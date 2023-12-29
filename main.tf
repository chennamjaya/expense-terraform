module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  env = var.env
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  azs = var.azs
  default_vpc_id = var.default_vpc_id
  account_no = var.account_no
  default_vpc_cidr = var.default_vpc_cidr
  default_route_table_id = var.default_route_table_id 
}

/*
module "public_lb" {
  source            = "./modules/alb"
  alb_sg_allow_cidr = "0.0.0.0/0"
  alb_type          = "public"
  env               = var.env
  internal          = false
  subnets           = module.vpc.public_subnets
  vpc_id            = module.vpc.vpc_id
  dns_name          = "${var.env}.vaishnavidevops.online"
  zone_id           = "Z0933457MNFW7LZX9MNJ"
  tg_arn            = module.frontend.tg_arn
}

module "private_lb" {
  source            = "./modules/alb"
  alb_sg_allow_cidr = var.vpc_cidr
  alb_type          = "private"
  env               = var.env
  internal          = true
  subnets           = module.vpc.private_subnets
  vpc_id            = module.vpc.vpc_id
  dns_name          = "backend-${var.env}.vaishnavidevops.online"
  zone_id           = "Z0933457MNFW7LZX9MNJ"
  tg_arn            = module.backend.tg_arn
}


module "frontend" {
  source = "./modules/app"
  app_port = 80
  component = "frontend"
  env = var.env
  instance_type = "t3.micro"
  vpc_cidr = var.vpc_cidr
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.private_subnets
  bastion_node_cidr = var.bastion_node_cidr
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  prometheus_cidr   = var.prometheus_cidr
  kms_key_id = var.kms_key_id
}

module "backend" {
  depends_on = [module.mysql] #this depends_on function is used so that this code will run ony after mysql
  source = "./modules/app"
  app_port = 8080
  component = "backend"
  env = var.env
  instance_type = "t3.micro"
  vpc_cidr = var.vpc_cidr
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.private_subnets
  bastion_node_cidr = var.bastion_node_cidr
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  prometheus_cidr   = var.prometheus_cidr
  kms_key_id = var.kms_key_id
}

module "mysql" {
  source = "./modules/rds"
  component = "mysql"
  env = var.env
  vpc_cidr = var.vpc_cidr
  vpc_id = module.vpc.vpc_id
  subnets = module.vpc.private_subnets
  instance_class         = var.instance_class
  kms_key_id = var.kms_key_id
}
*/

module "eks" {
  source = "./modules/eks"
  project_name = var.project_name
  env = var.env
  subnet_ids = module.vpc.private_subnets
  instance_types = var.instance_types
  node_count = var.node_count
}