resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "YES"
  }
}

resource "aws_subnet" "first" {
  vpc_id     = aws_vpc.vpc.id

  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "second" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.6.0/24"

  tags = {
    Name = "not"
  }
}

resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "hey"
  }
}

resource "aws_route_table" "example" {
vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "route-table-${var.route_table_name}"
  }
}

resource "aws_route_table_association" "iii" {
  subnet_id      = aws_subnet.first.id
  route_table_id = aws_route_table.example.id

}

resource "aws_route" "r" {
  route_table_id            = aws_route_table.example.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
}

resource "aws_instance" "qwer" {
  subnet_id     = aws_subnet.first.id
  ami           = var.ami
  instance_type = var.ins_type
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  tags = {
    Name = "EC2"
  }
}

resource "aws_instance" "not" {
  subnet_id     = aws_subnet.second.id
  ami           = var.ami2
  instance_type = var.ins_type2
  vpc_security_group_ids = [aws_security_group.my_server.id]
  
  tags = {
    Name = "MYec2"
  }
}

resource "aws_security_group" "my_webserver" {
  name        = "webser secur group"
  description = "Ekinchi"
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.port
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
  Name = "FIrst"
}
}

resource "aws_security_group" "my_server" {
  name        = "for practice"
  description = "BIR"
  vpc_id      = aws_vpc.vpc.id

 dynamic "ingress" {
    for_each = var.port
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
  Name = "SEcond"
}
}
