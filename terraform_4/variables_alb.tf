
variable "alb_target_group_name" {
  type    = string
  default = "group-vm-m9"
}

variable "alb_backend_group_name" {
  type    = string
  default = "group-backend-m9"
}

variable "alb_http_router_name" {
  type    = string
  default = "http-router-m9"
}

variable "alb_virtual_host_name" {
  type    = string
  default = "virtual-host-m9"
}

variable "alb_load_balancer_name" {
  type    = string
  default = "alb-m9"
}
