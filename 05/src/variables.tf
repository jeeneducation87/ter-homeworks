###cloud vars
variable "service_account_key_file" {
  type        = string
  sensitive = true
  description = "Путь к JSON-файлу сервисного аккаунта (значение задается в personal.auto.tfvars)"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

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
  description = "VPC network&subnet name"
}

###common vars

variable "vms_ssh_root_key" {
  type        = string
  sensitive = true
  description = "Путь к публичному SSH ключу (значение задается в personal.auto.tfvars)"
}

variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Название дистрибутива операционной системы"
}

