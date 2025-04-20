# Объявление переменных для пользовательских параметров

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "key_path" {
  description = "iam token service account"
  type        = string
}

variable "ssh_key_path" {
  description = "cat ~/.ssh/id_rsa.pub"
  type        = string
}
