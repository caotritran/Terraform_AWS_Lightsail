variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "instance_availability_zone" {
  type    = string
  default = "ap-southeast-1c"
}

variable "instance" {
  type    = string
  default = "TDA-TEST"
}

variable "instance_blueprintid" {
  type    = string
  default = "centos_7_2009_01"
}

variable "instance_bundleid" {
  type    = string
  default = "xlarge_2_0"
}

variable "intance_key_pair" {
  type    = string
  default = "id_rsa"
}

variable "static_ip" {
  type    = string
  default = "Wordpress-IP"
}

variable "static_ip_attachment" {
  type    = string
  default = "Wordpress-IP"
}
