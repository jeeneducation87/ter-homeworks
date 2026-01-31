locals {
  org = "netology"
  env = "platform"

  # "netology-develop-platform-web"
  vm_web_name = "${local.org}-${var.vpc_name}-${local.env}-web"
  
  # "netology-develop-platform-db"
  vm_db_name  = "${local.org}-${var.vpc_name}-${local.env}-db"
}