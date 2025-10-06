data "aws_ami" "os_image" {
    owners = ["099720109477"]
    most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}


resource aws_key_pair my-keypair {
  key_name   = "aman-practice-key"
  public_key = file("aman-practice-key.pub")
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my_sg" {
  name = "Aman-practice-sg"
  description = "this is security group created for aman practice"
  vpc_id = aws_default_vpc.default.id #interpolation

    ingress {
        description = "Allow access to ssh port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    ingress {
        description = "Allow access to http port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow all outgoing traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
}
tags = {
    Name = "Aman-practice-sg"
    Environment = "dev"
}
}

locals {
  instance = {
    "key1" : "instance_1"
    "key2" : "instance_2"
    "key3" : "instance_3"
  }
}

resource "aws_instance" "my-instance" {
    # count = var.aws_instance_count
    for_each = local.instance
    ami           = data.aws_ami.os_image.id
    instance_type = var.instance_type
    key_name      = aws_key_pair.my-keypair.key_name
    security_groups = [aws_security_group.my_sg.name] #interpolation
    root_block_device {
        volume_size = var.root_block_device
        volume_type = "gp3"    
    }

    
    tags = {
        Name = each.value
        Environment = "dev"
    }
  
}
