variable "zone" {
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type        = string
  default     = "ru-central1-a"
}
variable "v4_cidr_blocks" {
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "env_name" {
  description = "VPC network&subnet name"
  type        = string
  default     = "develop"
}

