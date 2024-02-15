resource "aws_acm_certificate" "in-main" {
  domain_name       = "example.com"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_vpc" "in-main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "YES"
  }
}

resource "aws_vpc" "in-main2" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "YES"
  }
}

<<<<<<< HEAD
resource "aws_vpc" "in-main3" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "YES"
  }
}

=======
>>>>>>> b26f33d734b7cf2e5783071977f4e21ac3b3b537

resource "aws_vpc" "in-practice" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "YES"
  }
}
