output "bucket_object_url" {
  value       = "https://storage.yandexcloud.net/${yandex_storage_bucket.bucket_m9.bucket}/${yandex_storage_object.image_m9.key}"
  description = "Ссылка на объект"
}

output "vm_info" {
  value = [
    for instance in yandex_compute_instance_group.ig_m9.instances : {
      name        = instance.name
      ip_internal = instance.network_interface[0].ip_address
    ip_external = instance.network_interface[0].nat_ip_address }
  ]
}

output "Application_Load_Balancer_info" {
  value       = yandex_alb_load_balancer.alb_load_balancer.listener.*.endpoint[0].*.address[0].*.external_ipv4_address
  description = "IP-адрес L7-балансировщика"
}
