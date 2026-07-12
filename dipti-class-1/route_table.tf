resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id 

    tags = {
      "Name" = "public_route_table"
    }
  
}

resource "aws_internet_gateway" "public_igw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
      "Name" = "main_igw"
    }
}

resource "aws_route" "internet_access" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_igw.id
  
}


resource "aws_route_table_association" "public_route_table_association" {
    subnet_id = aws_subnet.public_zone_a.id
    route_table_id = aws_route_table.public_rt.id
  
}