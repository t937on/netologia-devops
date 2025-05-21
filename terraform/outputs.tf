output "network_info" {
  description = "Список сетей"
  value = {
    network  = yandex_vpc_network.vpc_network.name
    subnet_1 = yandex_vpc_subnet.subnet_1.name
    subnet_2 = yandex_vpc_subnet.subnet_2.name
  }
}

output "nodes_info" {
  description = "Список имён всех master и worker нод"
  value = concat(
    [for instance in yandex_compute_instance.master_node : {
      name       = instance.name
      public_ip  = instance.network_interface[0].nat_ip_address
      private_ip = instance.network_interface[0].ip_address
    }],
    [for instance in yandex_compute_instance.worker_node : {
      name       = instance.name
      public_ip  = instance.network_interface[0].nat_ip_address
      private_ip = instance.network_interface[0].ip_address
    }]
  )
}

