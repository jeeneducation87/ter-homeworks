variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}


###vm web vars

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name for zone_a"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

# variable "vm_web_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
# }

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
}

# variable "vm_web_cores" {
#   type        = number
#   default     = "2"
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = "1"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = "5"
# }

###vm db vars

variable "b_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "b_vpc_name" {
  type        = string
  default     = "develop_b"
  description = "VPC network & subnet name for zone_b"
}

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

# variable "vm_db_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
# }

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
}

# variable "vm_db_cores" {
#   type        = number
#   default     = "2"
# }

# variable "vm_db_memory" {
#   type        = number
#   default     = "2"
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   default     = "20"
# }
