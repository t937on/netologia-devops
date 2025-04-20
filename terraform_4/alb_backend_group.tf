# Создать группу бэкендов
# https://yandex.cloud/ru/docs/application-load-balancer/operations/backend-group-create

resource "yandex_alb_backend_group" "alb_backend_group" {
  name = var.alb_backend_group_name

  session_affinity {
    connection {
      source_ip = true
    }
  }

  http_backend {
    name             = "http-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.alb_target_group.id]
    load_balancing_config {
      panic_threshold = 90
    }

    healthcheck {
      timeout             = "10s"
      interval            = "2s"
      healthy_threshold   = 10
      unhealthy_threshold = 15
      http_healthcheck {
        path = "/"
      }
    }
  }
  depends_on = [yandex_alb_target_group.alb_target_group]
}

