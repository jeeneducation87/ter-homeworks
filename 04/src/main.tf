resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = "${var.vpc_name}-${var.default_zone}"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    ssh_public_key = local.ssh_key
  }
}

# --- Универсальный модуль для всех ВМ ---
module "infrastructure_vms" {
  source   = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
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

  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.default_zone]
  subnet_ids     = [yandex_vpc_subnet.develop.id]

  labels = {
    owner   = each.value.owner_vm
    project = each.key
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}
