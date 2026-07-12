terraform {
  required_providers {
    
  }
}




resource "aws_instance" "database" {

    ami = var.aws_ami_ubuntu
    instance_type = "t2.micro"

    tags = {
      "Name" =  var.aws_instance_name
    }
  
}


output "web_server" {

    value = aws_instance.database.public_ip
  
}



