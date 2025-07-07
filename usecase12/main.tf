module "vpc" {
  source = "./modules/vpc"
  name           = var.name
  vpc_cidr_block = var.vpc_cidr_block
}

module "sg_group" {
  source     = "./modules/sg_group"
  vpc_id     = module.vpc.vpc_id
}

module "rds" {
  source               = "./modules/rds"
  name                 = var.name
  private_subnets      = module.vpc.private_subnets
  db_username          = var.db_username
  database_name        = var.database_name
  rds_security_group_ids  = [module.sg_group.rds_security_group_aurora_id]
}


# test aws cli to check connection of aurora database 
module "instances_test" {
  source          = "./modules/instance"
  subnet_id       = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.sg_group.ec2_security_group_id]
  name            = "instance-test"
}