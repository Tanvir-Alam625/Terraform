

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = var.public_route_table_name
    }
  
}

resource "aws_internet_gateway" "public_internet" {
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = var.internet_gateway_name
    }
}

resource "aws_route" "public_rt" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet.id  

}

resource "aws_route_table_association" "public_route_table_association" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.main.id


    tags = {
        "Name" = var.private_subnet_route_table_name
    }
}


resource "aws_route" "nat_route" {
    route_table_id = aws_route_table.private_rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "private_route_table_association" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private_rt.id
}

// AWS VPC for Zone 2

resource "aws_route_table" "public_rt_zone2" {
    vpc_id = aws_vpc.main.id

    tags = {
      "Name" = var.public_subnet_route_table_name_az2
    }
  
}

resource "aws_route_table" "private_rt_zone2" {
    vpc_id = aws_vpc.main.id 

    tags = {
      "Name" = var.private_subnet_route_table_name_az2
    }
}


resource "aws_route" "internet_access_zone2" {
  route_table_id = aws_route_table.public_rt_zone2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.public_internet.id

}
resource "aws_route_table_association" "zone2_route_table_association" {
    route_table_id = aws_route_table.public_rt_zone2.id
    subnet_id = aws_subnet.public_zone2.id
  
}

resource "aws_route" "internet_access_zone2_private_subnet" {
    route_table_id = aws_route_table.private_rt_zone2.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
}

resource "aws_route_table_association" "zone2_route_table_association_private_subent" {

  route_table_id = aws_route_table.private_rt_zone2.id
  subnet_id = aws_subnet.private_zone2.id
}

