
output "cluster_id" {
  description = "Идентификатор кластера MySQL"
  value       = yandex_mdb_mysql_cluster.cluster1.id
}

output "cluster_name" {
  description = "Имя кластера MySQL"
  value       = yandex_mdb_mysql_cluster.cluster1.name
}

