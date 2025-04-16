output "nat_instance_info" {
  value = {
    name        = yandex_compute_instance.nat_instance.name
    ip_external = yandex_compute_instance.nat_instance.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.nat_instance.network_interface[0].ip_address
    network     = yandex_vpc_network.vpc_network.name
    subnet      = yandex_vpc_subnet.subnet_public.name
  }
}

output "private_instance_info" {
  value = {
    name        = yandex_compute_instance.test_vm.name
    ip_external = yandex_compute_instance.test_vm.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.test_vm.network_interface[0].ip_address
    network     = yandex_vpc_network.vpc_network.name
    subnet      = yandex_vpc_subnet.subnet_private.name
  }
}
