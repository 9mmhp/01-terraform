/*
terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
*/

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami           = "ami-06eea3cd85e2db8ce"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "aws15-terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "aws15-terraform-example-instance"

  ingress {
    from_port   = var.server_port #출발포트
    to_port     = var.server_port #도착포트
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public IP Output
output "public-ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}
