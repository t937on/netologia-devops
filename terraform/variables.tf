###cloud vars
variable "key_path" {
  description = "iam token service account"
  type        = string
}

variable "ssh_key_path" {
  description = "cat ~/.ssh/id_rsa.pub"
  type        = string
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


###vpc
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###vm
variable "vm_image_family" {
  type        = string
  default     = "ubuntu-24-04-lts"
  description = "yandex compute image family.  https://yandex.cloud/en/docs/compute/operations/images-with-pre-installed-software/get-list#cli_1"
}

variable "vm_dev_cnt" {
  type        = number
  default     = 3
  description = "yandex compute instance resources cores"
}

variable "vm_dev_name" {
  type        = string
  default     = "vm-w"
  description = "yandex compute instance name"
}

variable "vm_dev_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "yandex compute instance platform id"
}

variable "vm_dev_cores" {
  type        = number
  default     = 4
  description = "yandex compute instance resources cores"
}

variable "vm_dev_memory" {
  type        = number
  default     = 8
  description = "yandex compute instance resources memory"
}

variable "vm_dev_core_fraction" {
  type        = number
  default     = 20
  description = "yandex compute instance resources core-fraction"
}

variable "vm_dev_preemptible" {
  type        = bool
  default     = true
  description = "yandex compute instance scheduling policy preemptible"
}

variable "vm_dev_nat" {
  type        = bool
  default     = true
  description = "yandex compute instance network interface nat"
}

variable "vm_dev_serial_port_enable" {
  type        = number
  default     = 1
  description = "yandex compute instance metadata serial-port-enable"
}

variable "vm_dev_user" {
  type        = string
  default     = "ubunter"
  description = "yandex compute instance metadata login user"
}

variable "vm_stop_for_update" {
  type        = bool
  default     = true
  description = "yandex compute instance allow_stopping_for_update"
}


# Master-node с теми же параметрами что Worker-node, только другое имя
variable "vm_dev_master_cnt" {
  type        = number
  default     = 1
  description = "yandex compute instance resources cores"
}

variable "vm_dev_master_name" {
  type        = string
  default     = "vm-m"
  description = "yandex compute instance name"
}

variable "vm_dev_master_cores" {
  type        = number
  default     = 4
  description = "yandex compute instance resources cores"
}

variable "vm_dev_master_memory" {
  type        = number
  default     = 8
  description = "yandex compute instance resources memory"
}
