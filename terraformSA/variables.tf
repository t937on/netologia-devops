# Описать переменные: название, тип, значение по умолчанию

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "service_account_name" {
  type    = string
  default = "service-account-m10"
}

variable "bucket_name" {
  type    = string
  default = "bucket-m10"
}

variable "region" {
  type    = string
  default = "ru-central1"
}
