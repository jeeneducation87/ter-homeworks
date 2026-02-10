module "vpc_dev" {
  source   = "./vpc"
  env_name = var.vpc_name
  zone     = var.default_zone
  cidr     = var.default_cidr[0]   
}


data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = local.ssh_key
  }
}

# --- Универсальный модуль для всех ВМ ---
module "infrastructure_vms" {
  source   = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=4d05fab"
  for_each = var.vms_resources

  env_name       = each.key
  instance_name  = "${each.key}-web"
  instance_count = each.value.instance_count

  instance_cores         = each.value.cores
  instance_memory        = each.value.memory
  instance_core_fraction = each.value.core_fraction
  boot_disk_size         = each.value.disk_size

  image_family   = var.vm_family
  public_ip      = true

  network_id     = module.vpc_dev.network_id
  subnet_zones   = [module.vpc_dev.subnet_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]

  labels = {
    owner   = each.value.owner_vm
    project = each.key
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}
