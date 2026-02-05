# resource "yandex_vpc_network" "develop" {
#   name = var.vpc_name
# }

# resource "yandex_vpc_subnet" "develop" {
#   name           = "${var.vpc_name}-${var.default_zone}"
#   zone           = var.default_zone
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.default_cidr
# }

# # --- Настройка Cloud-init ---
# data "template_file" "cloudinit" {
#   template = file("./cloud-init.yml")

#   vars = {
#     ssh_public_key = local.ssh_key
#   }
# }

# # --- Модуль Marketing VM ---
# module "marketing_vm" {
#   source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#   env_name       = "marketing"
#   network_id     = yandex_vpc_network.develop.id
#   subnet_zones   = [var.default_zone]
#   subnet_ids     = [yandex_vpc_subnet.develop.id]
#   instance_name  = "marketing-web"
#   instance_count = 1
#   image_family   = var.vm_family
#   public_ip      = true

#   labels = {
#     owner   = "i.ivanov"
#     project = "marketing"
#   }

#   metadata = {
#     user-data          = data.template_file.cloudinit.rendered
#     serial-port-enable = 1
#   }
# }

# # --- Модуль Analytics VM ---
# module "analytics_vm" {
#   source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
#   env_name       = "analytics"
#   network_id     = yandex_vpc_network.develop.id
#   subnet_zones   = [var.default_zone]
#   subnet_ids     = [yandex_vpc_subnet.develop.id]
#   instance_name  = "analytics-web"
#   instance_count = 1
#   image_family   = var.vm_family
#   public_ip      = true

#   labels = {
#     owner   = "i.petrov"
#     project = "analytics"
#   }

#   metadata = {
#     user-data          = data.template_file.cloudinit.rendered
#     serial-port-enable = 1
#   }
# }

