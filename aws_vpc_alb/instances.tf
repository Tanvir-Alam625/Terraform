resource "aws_key_pair" "ssh_key" {
    key_name   = "test_aws"
    public_key = file("/home/roy/.ssh/test_aws.pub")
}

resource "aws_instance" "public_instance" {
  
  ami = var.public_instance_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  subnet_id = aws_subnet.public.id
  key_name = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true

  tags = {
    "Name" = "Public_Instance_AZ1"
  }
}


resource "aws_instance" "private_instance" {
    ami = var.private_instance_ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.main_sg.id]
    subnet_id = aws_subnet.private.id
    key_name = aws_key_pair.ssh_key.key_name
    tags = {
        "Name" = "Private_Instance_AZ1"
    }
}



resource "aws_instance" "public_instance_az2" {
  
  ami = var.public_instance_ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  subnet_id = aws_subnet.public_zone2.id
  key_name = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = true

    tags = {
    "Name" = "Public_Instance_AZ2"
  }
}


resource "aws_instance" "private_instance_az_2" {
    ami = var.private_instance_ami
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.main_sg.id]
    subnet_id = aws_subnet.private_zone2.id
    key_name = aws_key_pair.ssh_key.key_name

    tags = {
    "Name" = "private_Instance_AZ2"
  }
    
}