variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "bucket_name" {
  type = string
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
