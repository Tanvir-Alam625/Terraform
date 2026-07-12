terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.0"
    }
  }

  backend "s3" {
    bucket = "my-terraform"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}


provider "aws" {
  region = var.aws_region
  profile = "Batch-8"
  
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    "Name" = "main-vpc"
  }
}


resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    "Name" = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    "Name" = "private-subnet"
  }
}

resource "aws_internet_gateway" "public_igw" {
    vpc_id = aws_vpc.main.id 

    tags = {
        Name = "main-igw"
    }
}


resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id 
    tags = {
      Name = "public_route_table"
    }
  
}

resource "aws_route" "default_route" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_igw.id

  
}


resource "aws_route_table_association" "public_rt_assoc" {

    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.public_rt.id 
  
}

resource "aws_security_group" "web_sg" {

    name = "web-server-sg"
    description = "Allow SSH And HTTP "
    vpc_id = aws_vpc.main.id 

    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "ssh_key" {
    key_name   = "test_aws"
    public_key = file("/home/roy/.ssh/test_aws.pub")
}



resource "aws_instance" "web_server_2" {
  
    ami = "ami-05d2d839d4f73aafb"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private-subnet.id
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    key_name = aws_key_pair.ssh_key.key_name
    tags = {
      Name = "web-server-pirvate-subnet"
    }
}

output "print_public_ip" {

  value = aws_instance.web_server_2.public_ip
  
}