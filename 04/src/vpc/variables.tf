variable "env_name" {
  type        = string
  description = "Имя окружения (используется для именования ресурсов)"
}

variable "zone" {
  type        = string
  description = "Зона доступности (например, ru-central1-a)"
}

variable "cidr" {
  type        = string
  description = "CIDR блок подсети (например, 10.0.1.0/24)"
}