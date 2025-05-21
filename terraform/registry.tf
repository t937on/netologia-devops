# https://yandex.cloud/ru/docs/container-registry/operations/registry/registry-access

variable "registry_name" {
  type        = string
  default     = "reestr-m10"
  description = "https://yandex.cloud/ru/docs/container-registry/operations/registry/registry-create"
}

resource "yandex_container_registry" "reg_m10" {
  name      = var.registry_name
  folder_id = var.folder_id
}

