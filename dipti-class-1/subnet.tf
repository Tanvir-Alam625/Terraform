

resource "aws_subnet" "public_zone_a" {

    vpc_id = aws_vpc.main.id
    cidr_block = var.public_zone_a_cidr
    availability_zone = var.public_zone_a_name
    map_public_ip_on_launch = true

    tags = {
      "Name"= var.public_subnet_zone_a_name
    }
}

resource "aws_subnet" "private_zone_a" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_zone_a_cidr
    availability_zone = var.public_zone_a_name


    tags = {
      "Name" = var.private_zone_a_name
    }
  
}

