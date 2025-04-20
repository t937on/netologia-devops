output "bucket_object_url" {
  value       = "https://storage.yandexcloud.net/${yandex_storage_bucket.bucket_m9.bucket}/${yandex_storage_object.image_m9.key}"
  description = "Ссылка на объект"
}

output "network_Load_Balancer_info" {
  value       = yandex_lb_network_load_balancer.nlb_m9.listener.*.external_address_spec[0].*.address
  description = "IP-адрес сетевого балансировщика"
}

output "vm_info" {
  value = [
    for instance in yandex_compute_instance_group.ig_m9.instances : {
      name        = instance.name
      ip_internal = instance.network_interface[0].ip_address
    ip_external = instance.network_interface[0].nat_ip_address }
  ]
}
