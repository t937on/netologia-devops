# Создать L7-балансировщик
# https://yandex.cloud/ru/docs/application-load-balancer/operations/application-load-balancer-create

resource "yandex_alb_load_balancer" "alb_load_balancer" {
  name       = var.alb_load_balancer_name
  network_id = yandex_vpc_network.network_m9.id

  allocation_policy {
    location {
      zone_id   = var.default_zone
      subnet_id = yandex_vpc_subnet.subnet_m9.id
    }
  }

  listener {
    name = "listener"
    endpoint {
      address {
        external_ipv4_address {} # ALB получит внешний IP автоматически
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.alb_http_router.id
      }
    }
  }

  depends_on = [yandex_alb_http_router.alb_http_router]
}
