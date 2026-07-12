
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.main_vpc_public_subnet_zone_1_cidr
    availability_zone = var.main_vpc_public_subnet_az_1

    tags = {
      "Name" = var.public_subnet_name
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.main_vpc_private_subnet_zone_1_cidr
    availability_zone = var.main_vpc_private_subnet_az_1


    tags = {
        "Name" = var.private_subnet_name
    }
}



resource "aws_subnet" "public_zone2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.main_vpc_public_subnet_zone_2_cidr
    availability_zone = var.main_vpc_public_subnet_az_2

    tags = {
      "Name" = var.public_subnet_az2_name
    }
  
}

resource "aws_subnet" "private_zone2" {
    vpc_id = aws_vpc.main.id 
    cidr_block = var.main_vpc_private_subnet_zone_2_cidr
    availability_zone = var.main_vpc_private_subnet_az_2

    tags = {
      "Name" = var.private_subnet_az2_name
    }
  
}
