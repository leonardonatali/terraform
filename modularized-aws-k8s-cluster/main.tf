module "networking" {
  source            = "./modules/networking"
  prefix            = var.prefix
  availability_zone = var.availability_zone
}

module "logs" {
  source            = "./modules/logs"
  prefix            = var.prefix
  cluster_name      = var.cluster_name
  retention_in_days = var.retention_in_days
}

module "permissions" {
  source       = "./modules/permissions"
  prefix       = var.prefix
  cluster_name = var.cluster_name
  depends_on = [
    module.networking
  ]
}

module "cluster" {
  source            = "./modules/cluster"
  prefix            = var.prefix
  cluster_name      = var.cluster_name
  desired_size      = var.desired_size
  max_size          = var.max_size
  min_size          = var.min_size
  subnet_ids        = module.networking.subnet_ids
  security_group_id = module.networking.security_group_id
  cluster_role_arn  = module.permissions.cluster_role_arn
  node_role_arn     = module.permissions.node_role_arn
  depends_on = [
    module.networking,
    module.permissions,
    module.logs
  ]
}
