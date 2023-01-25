provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "cron-server" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = var.tags
    security_groups = [aws_security_group.sg_ec2.name]
}

resource "aws_security_group" "sg_ec2" {
  name        = var.sg_name
  dynamic "ingress" { #Iterative for to create multiple ingress rules
    for_each = var.ingress_rules
    content {
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = ingress.value.protocol
        cidr_blocks      = ingress.value.cidr_blocks
    }
  }
}

resource "aws_s3_bucket" "tf-backend-cron-server" {
    bucket = var.bucket_name
    acl = var.acl
    tags = var.tags
    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_kms_key" "mykey" {
  description             = "Key for encrypt tfstate"
  deletion_window_in_days = 10
}

