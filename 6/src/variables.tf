variable "service_account_key_file" {
  description = "service account key file"
  type        = string
}

###cloud vars
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


variable "yandex_storage_bucket_name" {
  description = "yandex_storage_bucket name"
  type        = string
  default     = "simple-bucket"
}
variable "yandex_storage_bucket_max_size" {
  description = "yandex_storage_bucket max_size"
  type        = number
  default     = 1048576
}

variable "random_string_length" {
  description = "random_string length"
  type        = number
  default     = 8
}
variable "random_string_upper" {
  description = "random_string upper"
  type        = bool
  default     = false
}
variable "random_string_lower" {
  description = "random_string lower"
  type        = bool
  default     = true
}
variable "random_string_numeric" {
  description = "random_string numeric"
  type        = bool
  default     = true
}
variable "random_string_special" {
  description = "random_string special"
  type        = bool
  default     = false
}

