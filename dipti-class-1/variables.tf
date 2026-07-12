
variable "main_vpc_cidr" {
    type = string
    description = "Main VPC Cidr"

}

variable "public_zone_a_cidr" {
  type = string
  description = "Public Subnet On Zone a"

  
}



variable "private_zone_a_cidr" {
  type = string
  description = "Private Subnet On Zone a"

  
}




variable "public_zone_a_name" {

  type = string
  description = "Public Zone a Name "
  
}

variable "private_zone_a_name" {

  type = string
  description = "Public Zone a Name "
  
}



variable "main_vpc_name" {

  type = string
  description = "Main VPC Name"
  default = "Main"
  
}

variable "public_subnet_zone_a_name" {
  type = string
  description = "Public Subnet Name Zone a"
  default = "public_az_1"  
}


variable "private_subnet_zone_a_name" {
  type = string
  description = "Public Subnet Name Zone a"
  default = "private_az_1"  
}