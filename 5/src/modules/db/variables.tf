
variable "cluster_id" {
  description = "yandex_mdb_mysql_cluster output cluster_id"
  type        = string
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

variable "user_roles" {
  description = "yandex_mdb_mysql_user yandex_mdb_mysql_user roles"
  type        = string
  default     = "ALL"
}
