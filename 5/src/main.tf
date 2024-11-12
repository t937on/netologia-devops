
module "vpc_dev" {
  source         = "./modules/vpc"
  env_name       = var.vpc_name
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr
}

module "cluster_dev" {
  source         = "./modules/cluster"
  cluster_name   = var.cluster_name
  network_id     = module.vpc_dev.network_id
  host_subnet_id = module.vpc_dev.subnet_id
  host_zone      = var.default_zone
}

module "db_dev" {
  source        = "./modules/db"
  cluster_id    = module.cluster_dev.cluster_id
  database_name = var.database_name
  user_name     = var.user_name
  user_password = var.user_password
}

