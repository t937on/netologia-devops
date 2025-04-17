# Описать переменные: название, тип, значение по умолчанию

# Объявление переменных для "Создание ВМ"

variable "vm_name_nat" {
  type        = string
  default     = "vm-nat"
  description = "yandex compute instance name"
}

variable "boot_disk_nat" {
  type = list(object({
    size     = number
    type     = string
    image_id = string
  }))
  default = [{
    size     = 10
    type     = "network-hdd"
    image_id = "fd80mrhj8fl2oe87o4e1"
  }]
}

variable "network_nat_ip_address" {
  type        = string
  default     = "192.168.10.254"
  description = "yandex compute instance network_interface"
}


variable "vm_name_public" {
  type        = string
  default     = "vm-public"
  description = "yandex compute instance name"
}

variable "vm_name_private" {
  type        = string
  default     = "vm-private"
  description = "yandex compute instance name"
}

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-24-04-lts"
  description = "yandex compute image family.  https://yandex.cloud/en/docs/compute/operations/images-with-pre-installed-software/get-list#cli_1"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex compute instance platform id"
}

variable "vm_cores" {
  type        = number
  default     = 2
  description = "yandex compute instance resources cores"
}

variable "vm_memory" {
  type        = number
  default     = 2
  description = "yandex compute instance resources memory"
}

variable "vm_core_fraction" {
  type        = number
  default     = 20
  description = "yandex compute instance resources core-fraction"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "yandex compute instance scheduling policy preemptible"
}

variable "vm_nat" {
  type        = bool
  default     = true
  description = "yandex compute instance network interface nat"
}

variable "vm_serial_port_enable" {
  type        = number
  default     = 1
  description = "yandex compute instance metadata serial-port-enable"
}

variable "vm_user" {
  type    = string
  default = "ubunter"
}

variable "vm_stop_for_update" {
  type        = bool
  default     = true
  description = "yandex compute instance allow_stopping_for_update"
}
