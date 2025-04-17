
resource "yandex_compute_instance" "vm_private" {
  name = var.vm_name_private

  zone        = var.default_zone
  platform_id = var.vm_platform_id

  allow_stopping_for_update = var.vm_stop_for_update

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu24.image_id
    }
  }

  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory
    core_fraction = var.vm_core_fraction
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_private.id
    nat       = false
  }


  metadata = {
    serial-port-enable = var.vm_serial_port_enable
    ssh-keys           = local.ssh_key_file
    user-data          = <<-EOF
        #cloud-config
        users:
          - name: ${var.vm_user}
            ssh-authorized-keys:
              - ${local.ssh_key_file}
            sudo: ['ALL=(ALL) NOPASSWD:ALL']
            groups: [sudo]
        EOF
  }

}
