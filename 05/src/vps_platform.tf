variable "vms_resources" {
  description = "Параметры виртуальных машин для развертывания"
  type = map(object({
    owner_vm       = string
    instance_count = number
    cores          = number
    memory         = number
    core_fraction  = number
    disk_size = number
  }))
  
  default = {
    marketing = {
      owner_vm       = "i.ivanov"
      instance_count = 1
      cores          = 2
      memory         = 1
      core_fraction  = 5
      disk_size      = 10
    }
    analytics = {
      owner_vm       = "i.petrov"
      instance_count = 1 
      cores          = 2
      memory         = 2
      core_fraction  = 20
      disk_size      = 20
    }
  }
}
