
variable "lb_target_group_name" {
  type        = string
  default     = "lb-target-group-m10"
  description = "https://terraform-provider.yandexcloud.net/resources/lb_target_group.html"
}

resource "yandex_lb_target_group" "lb_target_group_m10" {
  name = var.lb_target_group_name
  dynamic "target" {
    for_each = yandex_compute_instance.worker_node
    content {
      subnet_id = target.value.network_interface[0].subnet_id
      address   = target.value.network_interface[0].ip_address
    }
  }
  depends_on = [yandex_compute_instance.master_node]
}


//
// Create a new Network Load Balancer (NLB).
//

variable "nlb_name" {
  type        = string
  default     = "lb-network-load-balancer-m10"
  description = "https://terraform-provider.yandexcloud.net/resources/lb_network_load_balancer.html"
}

resource "yandex_lb_network_load_balancer" "nlb_m10" {
  name = var.nlb_name

  listener {
    name        = "network-load-balancer-m10-listener"
    port        = 80
    target_port = 30001
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.lb_target_group_m10.id

    healthcheck {
      name = "healthcheck"
      tcp_options {
        port = 30001
      }
    }
  }

  depends_on = [yandex_lb_network_load_balancer.nlb_m10_grafana]
}

//
// Create a new Network Load Balancer (NLB).
//

resource "yandex_lb_network_load_balancer" "nlb_m10_grafana" {
  name = "grafana"

  listener {
    name        = "network-load-balancer-m10-grafana-listener"
    port        = 3000
    target_port = 30005
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.lb_target_group_m10.id

    healthcheck {
      name = "healthcheck"
      tcp_options {
        port = 30005
      }
    }
  }

  depends_on = [yandex_lb_target_group.lb_target_group_m10]
}
