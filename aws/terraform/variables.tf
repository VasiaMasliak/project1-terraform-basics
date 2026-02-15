variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "az" {
  type    = string
  default = null

}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "bucket_name" {
  type    = string
  default = "my-terraform-demo-2026-001"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
