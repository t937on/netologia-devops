# https://yandex.cloud/ru/docs/compute/operations/instance-groups/create-with-balancer#tf_1

resource "yandex_iam_service_account" "ig_sa" {
  name        = "ig-sa"
  description = "Сервисный аккаунт для управления группой ВМ."
}

resource "yandex_resourcemanager_folder_iam_member" "ig_role_editor" {
  folder_id  = var.folder_id
  role       = "editor"
  member     = "serviceAccount:${yandex_iam_service_account.ig_sa.id}"
  depends_on = [yandex_iam_service_account.ig_sa]
}

resource "yandex_compute_instance_group" "ig_m9" {
  name                = var.gr_vm_name
  folder_id           = var.folder_id
  service_account_id  = yandex_iam_service_account.ig_sa.id
  deletion_protection = false
  depends_on          = [yandex_resourcemanager_folder_iam_member.ig_role_editor]

  instance_template {
    platform_id = var.vm_platform_id
    resources {
      memory        = var.vm_memory
      cores         = var.vm_cores
      core_fraction = var.vm_core_fraction
    }

    scheduling_policy {
      preemptible = var.vm_preemptible
    }

    boot_disk {
      initialize_params {
        image_id = var.vm_boot_disk[0].image_id
        type     = var.vm_boot_disk[0].type
        size     = var.vm_boot_disk[0].size
      }
    }

    network_interface {
      network_id = yandex_vpc_network.network_m9.id
      subnet_ids = [yandex_vpc_subnet.subnet_m9.id]
      nat        = var.vm_nat
    }

    metadata = {
      serial-port-enable = var.vm_serial_port_enable
      ssh-keys           = local.ssh_key_file
      user-data          = <<-EOF
            #!/bin/bash
            cd /var/www/html
            echo '<html><head><title>Picture m9</title></head> <body><img src="https://storage.yandexcloud.net/${yandex_storage_bucket.bucket_m9.bucket}/${yandex_storage_object.image_m9.key}"/></body></html>' > index.html
            EOF
    }
  }

  scale_policy {
    fixed_scale {
      size = var.gr_vm_scale_policy
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  health_check {
    interval = 40
    timeout  = 10
    tcp_options {
      port = 80
    }
  }

  load_balancer {
    target_group_name        = var.gr_vm_target_group
    target_group_description = "Целевая группа Network Load Balancer"
  }
}