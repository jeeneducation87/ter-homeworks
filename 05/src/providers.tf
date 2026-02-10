terraform {
  required_version = "~>1.12.0"

  backend "s3" {
    region  = "ru-central1"
    bucket  = "spatonov-tfstate"
    key     = "terraform.tfstate"
    # encrypt = false
    use_lockfile = true

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
    
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
  }

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~>0.183.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~>2.2.0"
    }
  }
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.default_zone
  service_account_key_file = file(var.service_account_key_file)
}

