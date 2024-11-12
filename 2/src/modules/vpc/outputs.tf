output "info_subnet" {
  description = "info of the subnet"
  value       = yandex_vpc_subnet.vpc
}

output "subnet_id" {
  description = "info of the subnet id"
  value       = yandex_vpc_subnet.vpc.id
}

