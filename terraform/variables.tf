# Описать переменные: название, тип, значение по умолчанию

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone_2" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

# Объявление переменных для "Создание облачной сети"

variable "vpc_name" {
  type        = string
  default     = "vpc-m10"
  description = "VPC network & subnet name"
}


# Объявление переменных для "Создание подсетей"

variable "subnet_1_name" {
  type        = string
  default     = "subnet-1-m10"
  description = "subnet name"
}

variable "cidr_1" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "subnet_2_name" {
  type        = string
  default     = "subnet-2-m10"
  description = "subnet name"
}

variable "cidr_2" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
