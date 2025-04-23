# Описать переменные: название, тип, значение по умолчанию

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "bucket_name" {
  type    = string
  default = "bucket-m9"
}
