# Создать целевую группу Application Load Balancer
# https://yandex.cloud/ru/docs/application-load-balancer/operations/target-group-create

resource "yandex_alb_target_group" "alb_target_group" {
  name = var.alb_target_group_name

  # dynamic "target" {
  #   for_each = yandex_compute_instance.vms
  #   content {
  #     subnet_id = target.value.network_interface[0].subnet_id
  #     address   = target.value.network_interface[0].ip_address
  #   }
  # }

  dynamic "target" {
    # for_each = data.yandex_compute_instance.vms
    for_each = yandex_compute_instance_group.ig_m9.instances
    content {
      subnet_id  = target.value.network_interface[0].subnet_id
      ip_address = target.value.network_interface[0].ip_address
    }
  }
}
