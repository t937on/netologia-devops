resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = var.vpc_subnet_a_name
  zone           = var.zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr_a
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.vpc_subnet_b_name
  zone           = var.zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr_b
}

module "module1" {
  # source         = var.vm_dev_source
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vm_dev_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.zone_a, var.zone_b]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id, yandex_vpc_subnet.develop_b.id]
  instance_name  = var.vm_dev_instance_name
  instance_count = var.vm_dev_instance_cnt
  image_family   = var.default_vm_family
  public_ip      = var.default_vm_public_ip

  labels = {
    project = var.vm_dev_labels["project"]
  }

  metadata = {
    serial-port-enable = var.default_vm_metadata["serial-port-enable"]
    user-data          = data.template_file.cloudinit.rendered
  }

}

module "module2" {
  # source         = var.vm_stage_source
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.vm_stage_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = [var.zone_a]
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.vm_stage_instance_name
  instance_count = var.vm_stage_instance_cnt
  image_family   = var.default_vm_family
  public_ip      = var.default_vm_public_ip

  labels = {
    project = var.vm_stage_labels["project"]
  }

  metadata = {
    serial-port-enable = var.default_vm_metadata["serial-port-enable"]
    user-data          = data.template_file.cloudinit.rendered
  }

}


data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = file(var.ssh_public_key)
  }
}

