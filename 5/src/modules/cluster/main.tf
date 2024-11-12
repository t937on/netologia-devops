
resource "yandex_mdb_mysql_cluster" "cluster1" {
  name        = var.cluster_name
  environment = var.cluster_environment
  network_id  = var.network_id
  version     = var.cluster_version

  resources {
    resource_preset_id = var.cluster_resource_preset_id
    disk_type_id       = var.cluster_disk_type_id
    disk_size          = var.cluster_disk_size
  }

  dynamic "host" {
    for_each = var.ha ? [1] : [1, 2] # Один хост, если true, два хоста, если false
    content {
      zone      = var.host_zone
      subnet_id = var.host_subnet_id
    }
  }

}

