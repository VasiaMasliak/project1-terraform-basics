terraform {
  required_version = ">=1.5.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_key_pair" "pub_key" {
    key_name = "${var.project}-key"
    public_key = file(var.public_key_path)
    tags = {
      project = var.project
    }
}

resource "aws_security_group" "vm_sg" {
    name = "${var.project}-sg"
    description = "Allow SSH"
    ingress = {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
    egress = {
        from_port = 0 
        to_port = 0
        protocol = "-1"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
    tags = {
      project = var.project
    }
}

data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["137112412989"]
    filter {
      name = "name"
      values = [
        "al2023-ami-*-x86_64"
       ]
    }
}

resource "aws_instance" "vm" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    key_name = aws_key_pair.pub_key.key_name
    vpc_security_group_ids = [ aws_security_group.vm_sg.id ]
    tags = {
      Name = "${var.project}-vm",
      project = var.project
    }
}

resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
    tags = {
      project = var.project
    }
}

