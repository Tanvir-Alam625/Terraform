variable "aws_ami_ubuntu" {

    type = string
    default = "ami-7235678fg9"
  
}


variable "aws_instance_name" {

    type = string

    default = "web-server"
  
}

variable "instance_type" {
    type = string
    default = "web"
}