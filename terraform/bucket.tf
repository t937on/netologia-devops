# https://yandex.cloud/ru/docs/storage/operations/objects/upload
# https://yandex.cloud/ru/docs/storage/operations/buckets/encrypt

# Создание сервисного аккаунта

resource "yandex_iam_service_account" "sa_m9" {
  name = "sa-m9-3"
}

# Назначение роли сервисному аккаунту

resource "yandex_resourcemanager_folder_iam_member" "sa_resourcemanager_m9" {
  folder_id  = var.folder_id
  role       = "storage.editor"
  member     = "serviceAccount:${yandex_iam_service_account.sa_m9.id}"
  depends_on = [yandex_iam_service_account.sa_m9]
}

resource "yandex_resourcemanager_folder_iam_member" "sa_editor_encrypter_decrypter" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.sa_m9.id}"
}

# Создание статического ключа доступа

resource "yandex_iam_service_account_static_access_key" "sa_static_key_m9" {
  service_account_id = yandex_iam_service_account.sa_m9.id
  description        = "static access key for object storage"
}

# Создание bucket
resource "yandex_storage_bucket" "bucket_m9" {
  bucket     = var.bucket_name
  acl        = "public-read-write" # Публичный доступ
  access_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.secret_key

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.kms_symmetric_key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }

}

# Создание объекта

resource "yandex_storage_object" "image_m9" {
  access_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa_static_key_m9.secret_key
  bucket     = yandex_storage_bucket.bucket_m9.bucket
  key        = "picture_m9"
  source     = "img/picture_m9.webp"
  acl        = "public-read" # Публичный доступ
  depends_on = [yandex_storage_bucket.bucket_m9]
}

resource "yandex_kms_symmetric_key" "kms_symmetric_key" {
  name              = "symmetric-key-m9"
  description       = "bucket encrypt key"
  default_algorithm = "AES_128"
  rotation_period   = "24h"
}
