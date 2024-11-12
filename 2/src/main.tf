
module "vpc_dev" {
  source         = "./modules/vpc"
  env_name       = var.vpc_name
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr
}

module "vm_dev" {
  source       = "./modules/vm"
  vm_name      = var.vm_web_name
  vm_subnet_id = module.vpc_dev.subnet_id
  vm_user_data = data.template_file.cloudinit.rendered
}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = file(var.ssh_public_key_file)
  }
}

