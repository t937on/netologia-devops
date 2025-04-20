# Создание облачной сети

resource "yandex_vpc_network" "network_m9" {
  name = var.vpc_name
}

# Создание подсетей

resource "yandex_vpc_subnet" "subnet_m9" {
  name           = var.subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network_m9.id
  v4_cidr_blocks = var.default_cidr
}
