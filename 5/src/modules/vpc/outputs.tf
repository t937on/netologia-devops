output "info_subnet" {
  description = "info of the subnet"
  value       = yandex_vpc_subnet.vpc
}

output "subnet_id" {
  description = "info of the subnet id"
  value       = yandex_vpc_subnet.vpc.id
}

output "network_id" {
  description = "info of the net id"
  value       = yandex_vpc_network.vpc.id
}

