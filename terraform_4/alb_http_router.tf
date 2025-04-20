# Создать HTTP-роутер для HTTP-трафика
# https://yandex.cloud/ru/docs/application-load-balancer/operations/http-router-create

resource "yandex_alb_http_router" "alb_http_router" {
  name = var.alb_http_router_name
  labels = {
    tf-label    = "tf-label-value"
    empty-label = ""
  }
}

resource "yandex_alb_virtual_host" "alb_virtual_host" {
  name           = var.alb_virtual_host_name
  http_router_id = yandex_alb_http_router.alb_http_router.id
  route {
    name = "http-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.alb_backend_group.id
        timeout          = "60s"
      }
    }
  }
  depends_on = [yandex_alb_backend_group.alb_backend_group]
}
