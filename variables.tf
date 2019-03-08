variable "region" {
  default = "us-central1"
}

variable "region_zone" {
  default = "us-central1-f"
}

variable "shopfront_install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/shopfront_install.sh"
}

variable "productcatalogue_install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/productcatalogue_install.sh"
}

variable "stockmanager_install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "scripts/stockmanager_install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}

variable "instance_type" {
  default = "n1-standard-1"
}

variable "instance_image" {
  default = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "shopfront_port" {
  default = "80"
}

variable "productcatalogue_port" {
  default = "8020"
}

variable "stockmanager_port" {
  default = "8030"
}
