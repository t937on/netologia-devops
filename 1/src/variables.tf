variable "service_account_key_file" {
  description = "service account key file"
  type        = string
}

variable "ssh_public_key" {
  description = "ssh public key"
  type        = string
}

###cloud vars
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

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vpc_subnet_a_name" {
  type        = string
  default     = "develop-ru-central1-a"
  description = "VPC network&subnet name"
}
variable "vpc_subnet_b_name" {
  type        = string
  default     = "develop-ru-central1-b"
  description = "VPC network&subnet name"
}

variable "zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


###vm vars
variable "vm_dev_name" {
  type        = string
  default     = "develop"
  description = "vm develop"
}

variable "vm_stage_name" {
  type        = string
  default     = "stage"
  description = "vm stage"
}

variable "vm_dev_source" {
  type        = string
  default     = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  description = "vm source"
}

variable "vm_stage_source" {
  type        = string
  default     = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  description = "vm source"
}

variable "vm_dev_instance_name" {
  type        = string
  default     = "webs"
  description = "vm develop instance name"
}

variable "vm_stage_instance_name" {
  type        = string
  default     = "web-stage"
  description = "vm stage instance name"
}

variable "vm_dev_instance_cnt" {
  type        = number
  default     = 2
  description = "vm develop instance count"
}

variable "vm_stage_instance_cnt" {
  type        = number
  default     = 1
  description = "vm stage instance count"
}

variable "default_vm_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex compute image ubuntu"
}

variable "default_vm_public_ip" {
  type        = bool
  default     = true
  description = "yandex compute public ip"
}

variable "vm_dev_labels" {
  type = map(string)
  default = {
    "owner"   = "i.ivanov",
    "project" = "marketing"
  }
  description = "vm develop labels"
}

variable "vm_stage_labels" {
  type = map(string)
  default = {
    "project" = "analytics"
  }
  description = "vm stage labels"
}

variable "default_vm_metadata" {
  description = "Метаданные ВМ"
  type = object({
    serial-port-enable = number
  })
  default = {
    serial-port-enable = 1
  }
}



























