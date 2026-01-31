###cloud vars

variable "cloud_id" {
  type        = string
  sensitive = true
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  sensitive = true
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "service_account_key_file" {
  type        = string
  sensitive = true
  description = "Путь к JSON-файлу сервисного аккаунта (значение задается в personal.auto.tfvars)"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  sensitive = true
  description = "Путь к публичному SSH ключу (значение задается в personal.auto.tfvars)"
}

