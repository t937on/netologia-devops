output "database_id" {
  description = "Идентификатор базы данных MySQL"
  value       = yandex_mdb_mysql_database.db1.id
}

output "database_name" {
  description = "Имя базы данных MySQL"
  value       = yandex_mdb_mysql_database.db1.name
}

output "user_id" {
  description = "Идентификатор пользователя MySQL"
  value       = yandex_mdb_mysql_user.user1.id
}

output "user_name" {
  description = "Имя пользователя MySQL"
  value       = yandex_mdb_mysql_user.user1.name
}
