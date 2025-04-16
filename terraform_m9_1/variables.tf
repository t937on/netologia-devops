# Описать переменные: название, тип, значение по умолчанию

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

# Объявление переменных для "Создание облачной сети"

variable "vpc_name" {
  type        = string
  default     = "dvl_vpc"
  description = "VPC network & subnet name"
}

# Объявление переменных для "Создание подсетей"

variable "subnet_public_name" {
  type        = string
  default     = "public"
  description = "subnet name"
}

variable "cidr_public" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
