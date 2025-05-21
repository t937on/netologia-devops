data "yandex_compute_image" "ubuntu24" {
  family = var.vm_image_family
}

resource "yandex_compute_instance" "master_node" {
  count = var.vm_master_cnt
  name  = var.vm_master_name

  zone        = var.default_zone
  platform_id = var.vm_platform_id

  allow_stopping_for_update = var.vm_stop_for_update

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu24.image_id
      type     = var.vm_boot_disk_type
      size     = var.vm_boot_disk_size
    }
  }
  resources {
    cores         = var.vm_master_cores
    memory        = var.vm_master_memory
    core_fraction = var.vm_core_fraction
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_1.id
    nat       = var.vm_nat
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
            shell: /bin/bash
        package_update: true
        package_upgrade: false
        packages:
          - curl
          - git
      EOF
  }
}

resource "yandex_compute_instance" "worker_node" {
  count = var.vm_worker_cnt
  name  = "${var.vm_worker_name}-${count.index + 1}"

  zone        = var.zone_2
  platform_id = var.vm_platform_id

  allow_stopping_for_update = var.vm_stop_for_update

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu24.image_id
      type     = var.vm_boot_disk_type
      size     = var.vm_boot_disk_size
    }
  }
  resources {
    cores         = var.vm_worker_cores
    memory        = var.vm_worker_memory
    core_fraction = var.vm_core_fraction
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_2.id
    nat       = var.vm_nat
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
            shell: /bin/bash
        package_update: true
        package_upgrade: false
        packages:
          - curl
          - git
        EOF
  }
}
