data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}

resource "yandex_compute_instance" "platform" {
  name        = var.vm_name
  zone        = var.vm_zone
  platform_id = var.vm_platform_id
  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory
    core_fraction = var.vm_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_preemptible
  }
  network_interface {
    subnet_id = var.vm_subnet_id
    nat       = var.vm_nat
  }

  metadata = {
    serial-port-enable = var.vm_serial_port_enable
    user-data = var.vm_user_data
  }

  allow_stopping_for_update = var.vm_allow_stopping_for_update

}

