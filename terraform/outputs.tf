output "network_info" {
  value = {
    network        = yandex_vpc_network.vpc_network.name
    subnet_public  = yandex_vpc_subnet.subnet_public.name
    subnet_private = yandex_vpc_subnet.subnet_private.name
  }
}

output "nat_instance_info" {
  value = {
    name        = yandex_compute_instance.nat_instance.name
    ip_external = yandex_compute_instance.nat_instance.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.nat_instance.network_interface[0].ip_address
  }
}

output "vm_public_info" {
  value = {
    name        = yandex_compute_instance.vm_public.name
    ip_external = yandex_compute_instance.vm_public.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.vm_public.network_interface[0].ip_address
  }
}

output "vm_private_info" {
  value = {
    name        = yandex_compute_instance.vm_private.name
    ip_external = yandex_compute_instance.vm_private.network_interface[0].nat_ip_address
    ip_internal = yandex_compute_instance.vm_private.network_interface[0].ip_address
  }
}

