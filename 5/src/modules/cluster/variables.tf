variable "cluster_name" {
  description = "yandex_mdb_mysql_cluster name"
  type        = string
}

variable "cluster_environment" {
  description = "yandex_mdb_mysql_cluster environment"
  type        = string
  default     = "PRODUCTION"
}

variable "network_id" {
  description = "yandex_mdb_mysql_cluster network ID"
  type        = string
}

variable "cluster_version" {
  description = "yandex_mdb_mysql_cluster version"
  type        = string
  default     = "8.0"
}

variable "cluster_resource_preset_id" {
  description = "yandex_mdb_mysql_cluster verresource_preset_idsion"
  type        = string
  default     = "b1.medium"
}

variable "cluster_disk_type_id" {
  description = "yandex_mdb_mysql_cluster disk_type_id"
  type        = string
  default     = "network-hdd"
}

variable "cluster_disk_size" {
  description = "yandex_mdb_mysql_cluster disk_size"
  type        = number
  default     = 10
}

variable "host_subnet_id" {
  description = "yandex_mdb_mysql_cluster host subnet_id"
  type        = string
}

variable "host_zone" {
  description = "yandex_mdb_mysql_cluster host zone"
  type        = string
}

variable "ha" {
  description = "yandex_mdb_mysql_cluster use single host"
  type        = bool
  default     = false
}

