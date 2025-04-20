# Группа виртуальных машин

variable "gr_vm_name" {
  type    = string
  default = "group-vm-m9"
}

variable "gr_vm_scale_policy" {
  type    = number
  default = 3
}

variable "gr_vm_target_group" {
  type    = string
  default = "groups-vm-m9-target-group"
}

# Шаблон виртуальной машины

variable "vm_name" {
  type        = string
  default     = "vm"
  description = "yandex compute instance name"
}

variable "vm_boot_disk" {
  type = list(object({
    size     = number
    type     = string
    image_id = string
  }))
  default = [{
    size     = 10
    type     = "network-hdd"
    image_id = "fd827b91d99psvq5fjit"
  }]
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
  default     = 1
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
  type        = string
  default     = "ubunter"
  description = "yandex compute instance metadata login user"
}

variable "vm_stop_for_update" {
  type        = bool
  default     = true
  description = "yandex compute instance allow_stopping_for_update"
}
