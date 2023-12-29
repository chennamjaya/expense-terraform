env = "dev"
project_name = "expense"
vpc_cidr               = "10.0.0.0/16"
public_subnets         = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets        = ["10.0.2.0/24", "10.0.3.0/24"]
azs                    = ["us-east-1a", "us-east-1b"]
default_vpc_id         = "vpc-0f85d7a6071a32e51"
default_vpc_cidr       = "172.31.0.0/16"
default_route_table_id = "rtb-03c2c7536a2ba77b5"
account_no             = "851512651356"
bastion_node_cidr      = [ "172.31.84.99/32" ]
desired_capacity       = 1
max_size               = 1
min_size               = 1
instance_class         = "db.t3.medium"
prometheus_cidr        =["172.31.40.199/32"]
kms_key_id             ="arn:aws:kms:us-east-1:851512651356:key/a916f8da-24bf-448f-af0a-7f41d920fce0"

#eks
node_count = 2
instance_types = ["t3.large"]