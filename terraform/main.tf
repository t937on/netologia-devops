# Создание облачной сети

resource "yandex_vpc_network" "vpc_network" {
  name = var.vpc_name
}

# Создание подсетей

resource "yandex_vpc_subnet" "subnet_1" {
  name           = var.subnet_1_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.cidr_1
}

resource "yandex_vpc_subnet" "subnet_2" {
  name           = var.subnet_2_name
  zone           = var.zone_2
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.cidr_2
}
