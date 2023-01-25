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
  name        = "var.sg_name"
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