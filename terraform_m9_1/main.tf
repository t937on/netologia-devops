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
