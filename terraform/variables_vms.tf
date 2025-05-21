variable "vm_image_family" {
  type        = string
  default     = "ubuntu-24-04-lts"
  description = "yandex compute image family.  https://yandex.cloud/en/docs/compute/operations/images-with-pre-installed-software/get-list#cli_1"
}


variable "vm_boot_disk_type" {
  type    = string
  default = "network-hdd"
}

variable "vm_boot_disk_size" {
  type    = number
  default = 10
}


variable "vm_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex compute instance platform id"
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


# Master-node
variable "vm_master_cnt" {
  type    = number
  default = 1
}

variable "vm_master_name" {
  type        = string
  default     = "vm-m"
  description = "yandex compute instance name"
}

variable "vm_master_cores" {
  type        = number
  default     = 2
  description = "yandex compute instance resources cores"
}

variable "vm_master_memory" {
  type        = number
  default     = 4
  description = "yandex compute instance resources memory"
}


# Worker-node
variable "vm_worker_cnt" {
  type    = number
  default = 2
}

variable "vm_worker_name" {
  type        = string
  default     = "vm"
  description = "yandex compute instance name"
}

variable "vm_worker_cores" {
  type        = number
  default     = 4
  description = "yandex compute instance resources cores"
}

variable "vm_worker_memory" {
  type        = number
  default     = 8
  description = "yandex compute instance resources memory"
}
