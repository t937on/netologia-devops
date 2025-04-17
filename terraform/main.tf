# Создание облачной сети

resource "yandex_vpc_network" "vpc_network" {
  name = var.vpc_name
}

# Создание подсетей

resource "yandex_vpc_subnet" "subnet_public" {
  name           = var.subnet_public_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.cidr_public
}

resource "yandex_vpc_subnet" "subnet_private" {
  name           = var.subnet_private_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.cidr_private
  route_table_id = yandex_vpc_route_table.nat_instance_route_private.id
}

# Создание таблицы маршрутизации и статического маршрута

resource "yandex_vpc_route_table" "nat_instance_route_private" {
  name       = var.route_table_private_name
  network_id = yandex_vpc_network.vpc_network.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.nat_instance.network_interface[0].ip_address
  }
}


# Добавление готового образа ВМ

data "yandex_compute_image" "ubuntu24" {
  family = var.vm_image_family
}
