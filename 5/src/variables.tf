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
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "cluster_name" {
  description = "yandex_mdb_mysql_cluster name"
  type        = string
  default     = "example"
}

variable "database_name" {
  description = "yandex_mdb_mysql_database name"
  type        = string
  default     = "test"
}

variable "user_name" {
  description = "yandex_mdb_mysql_user yandex_mdb_mysql_user name"
  type        = string
  default     = "app"
}

variable "user_password" {
  description = "yandex_mdb_mysql_user yandex_mdb_mysql_user password"
  type        = string
}
