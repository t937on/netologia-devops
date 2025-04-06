resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu24" {
  family = var.vm_image_family
}


resource "yandex_compute_instance" "platform" {
  count = var.vm_dev_cnt
  name  = "${var.vm_dev_name}-${count.index + 1}"

  zone        = var.default_zone
  platform_id = var.vm_dev_platform_id

  allow_stopping_for_update = var.vm_stop_for_update

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu24.image_id
    }
  }
  resources {
    cores         = var.vm_dev_cores
    memory        = var.vm_dev_memory
    core_fraction = var.vm_dev_core_fraction
  }

  scheduling_policy {
    preemptible = var.vm_dev_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_dev_nat
  }

  metadata = {
    serial-port-enable = var.vm_dev_serial_port_enable
    ssh-keys           = local.ssh_key_file
    user-data          = <<-EOF
        #cloud-config
        users:
          - name: ${var.vm_dev_user}
            ssh-authorized-keys:
              - ${local.ssh_key_file}
            sudo: ['ALL=(ALL) NOPASSWD:ALL']
            groups: [sudo]
        EOF
  }

}

resource "yandex_compute_instance" "platform_master_node" {
  count = var.vm_dev_master_cnt
  name  = "${var.vm_dev_master_name}-${count.index + 1}"

  zone        = var.default_zone
  platform_id = var.vm_dev_platform_id

  allow_stopping_for_update = var.vm_stop_for_update

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu24.image_id
    }
  }
  resources {
    cores         = var.vm_dev_master_cores
    memory        = var.vm_dev_master_memory
    core_fraction = var.vm_dev_core_fraction
  }

  scheduling_policy {
    preemptible = var.vm_dev_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_dev_nat
  }

  metadata = {
    serial-port-enable = var.vm_dev_serial_port_enable
    ssh-keys           = local.ssh_key_file
    user-data          = <<-EOF
        #cloud-config
        users:
          - name: ${var.vm_dev_user}
            ssh-authorized-keys:
              - ${local.ssh_key_file}
            sudo: ['ALL=(ALL) NOPASSWD:ALL']
            groups: [sudo]
        EOF
  }
}
