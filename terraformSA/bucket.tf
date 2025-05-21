# Создание сервисного аккаунта

resource "yandex_iam_service_account" "sa" {
  name = var.service_account_name
}

# Назначение роли сервисному аккаунту
# editor (для управления ресурсами в папке)
resource "yandex_resourcemanager_folder_iam_member" "sa_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Создание статического ключа доступа

resource "yandex_iam_service_account_static_access_key" "sa_static_key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

# Создание бакета

resource "yandex_storage_bucket" "bucket_backend" {
  bucket        = var.bucket_name
  access_key    = yandex_iam_service_account_static_access_key.sa_static_key.access_key
  secret_key    = yandex_iam_service_account_static_access_key.sa_static_key.secret_key
  acl           = "private"
  force_destroy = true
}
