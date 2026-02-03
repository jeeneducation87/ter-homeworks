variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    fraction    = number
    disk_volume = number
  }))
  default = [
    { vm_name = "main", cpu = 2, ram = 2, fraction = 20, disk_volume = 10 },
    { vm_name = "replica", cpu = 2, ram = 1, fraction = 20, disk_volume = 9 }
  ]
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}

resource "yandex_compute_instance" "db" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = each.value.vm_name
  platform_id = var.vm_platform_id
  zone        = var.default_zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_volume
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }
}
