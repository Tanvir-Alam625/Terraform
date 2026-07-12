

resource "aws_instance" "web" {

    ami = "ami-05d2d839d4f73aafb"
    instance_type =  "t2.micro"
    subnet_id = aws_subnet.public_zone_a.id 
    vpc_security_group_ids = [aws_security_group.main_sg.id]
    key_name = aws_key_pair.ssh_key.key_name

    tags = {
      "Name" = "web-server"
    }
  
}


resource "aws_key_pair" "ssh_key" {
    key_name = "dipti_key"
    public_key = file("/home/roy/.ssh/dipti.pub")
  
}

output "print_ec2_ip" {
  
  value = aws_instance.web.public_ip
}