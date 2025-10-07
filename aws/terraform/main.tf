terraform {
  required_version = ">=1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az
  tags = {
    Name = "${var.project}-public-subnet"
  }
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [ aws_vpc.main.id ]
  }
}

resource "aws_key_pair" "pub_key" {
  key_name   = "${var.project}-key"
  public_key = file(var.public_key_path)
  tags = {
    project = var.project
  }
}

resource "aws_security_group" "vm_sg" {
  name        = "${var.project}-sg"
  description = "Allow SSH"
  vpc_id      = aws_vpc.main.id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
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
  owners      = ["137112412989"]
  filter {
    name = "name"
    values = [
      "al2023-ami-*-x86_64"
    ]
  }
}

resource "aws_instance" "vm" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.pub_key.key_name
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.vm_sg.id]
  tags = {
    Name    = "${var.project}-vm",
    project = var.project
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags = {
    project = var.project
  }
}

resource "aws_s3_bucket_public_access_block" "pab" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


