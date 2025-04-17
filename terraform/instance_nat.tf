
resource "yandex_compute_instance" "nat_instance" {
  name = var.vm_name_nat

  zone        = var.default_zone
  platform_id = var.vm_platform_id

  allow_stopping_for_update = var.vm_stop_for_update

  boot_disk {
    initialize_params {
      image_id = var.boot_disk_nat[0].image_id
      type     = var.boot_disk_nat[0].type
      size     = var.boot_disk_nat[0].size
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
    subnet_id  = yandex_vpc_subnet.subnet_public.id
    nat        = var.vm_nat
    ip_address = var.network_nat_ip_address
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
