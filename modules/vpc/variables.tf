variable "cidr_block" {
  default = "172.16.0.0/20"
}

variable "public_subnet" {
  default = "172.16.0.0/22"
}

variable "project" {
  default = "webweaver"
}

variable "env" {
  default = "dev"
}