variable "project" {
  type = string
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "storage_name" {
  type = string
}