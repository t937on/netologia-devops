output "bucket_object_url" {
  value       = "https://storage.yandexcloud.net/${yandex_storage_bucket.bucket_m9.bucket}/${yandex_storage_object.image_m9.key}"
  description = "Ссылка на объект в storage"
}
