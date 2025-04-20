# https://yandex.cloud/ru/docs/storage/operations/objects/upload

# Создание сервисного аккаунта

resource "yandex_iam_service_account" "sa_m9" {
  name = "sa-m9-2"
}

# Назначение роли сервисному аккаунту

resource "yandex_resourcemanager_folder_iam_member" "sa_resourcemanager_m9" {
  folder_id  = var.folder_id
  role       = "storage.editor"
  member     = "serviceAccount:${yandex_iam_service_account.sa_m9.id}"
  depends_on = [yandex_iam_service_account.sa_m9]
}

# Создание статического ключа доступа

resource "yandex_iam_service_account_static_access_key" "sa_static_key_m9" {
  service_account_id = yandex_iam_service_account.sa_m9.id
  description        = "static access key for object storage"
}

# Создание bucket
resource "yandex_storage_bucket" "bucket_m9" {
  bucket     = var.bucket_name
  acl        = "public-read" # Публичный доступ на чтение
  access_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.secret_key
}

# Создание объекта

resource "yandex_storage_object" "image_m9" {
  access_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.secret_key
  bucket     = yandex_storage_bucket.bucket_m9.bucket
  key        = "picture_m9.webp"
  source     = "img/picture_m9.webp"
  acl        = "public-read" # Публичный доступ
}
