# Описать переменные: название, тип, значение по умолчанию

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

variable "bucket_name" {
  type    = string
  default = "bucket-m9"
}

variable "vpc_name" {
  type        = string
  default     = "vpc-m9"
  description = "VPC network & subnet name"
}

variable "subnet_name" {
  type        = string
  default     = "subnet-m9"
  description = "VPC network & subnet name"
}
