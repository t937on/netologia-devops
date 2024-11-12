variable "vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image"
}

variable "vm_name" {
  description = "yandex compute instance name"
  type        = string
  default     = "dev"
}

variable "vm_zone" {
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type        = string
  default     = "ru-central1-a"
}


variable "vm_platform_id" {
  type        = string
  default     = "standard-v2"
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
  default     = 5
  description = "yandex compute instance resources core-fraction"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "yandex compute instance scheduling policy preemptible"
}

variable "vm_subnet_id" {
  type        = string
  description = "yandex compute instance network subnet id"
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

variable "vm_user_data" {
  type        = string
  description = "yandex compute instance metadata user-data"
}

variable "vm_allow_stopping_for_update" {
  type        = bool
  default     = true
  description = "yandex compute instance allow_stopping_for_update"
}


