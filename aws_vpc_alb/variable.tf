

variable "main_vpc_cidr" {
    type = string
    description = "Main VPC CIDR Value"
}

variable "main_vpc_public_subnet_az_1" {
    type = string
    description = "Main VPC Public Subnet Availability Zone 1"
}

variable "main_vpc_public_subnet_zone_1_cidr" {
    type = string
    description = "Main VPC Public Subnet Availability Zone CIDR Value 1"
}


variable "main_vpc_private_subnet_az_1" {
    type = string
    description = "Main VPC Private Subnet  Availability Zone 1"
}

variable "main_vpc_private_subnet_zone_1_cidr" {
    type = string
    description = "Main VPC Private Subnet Availability Zone 1 CIDR Value"
}

variable "main_vpc_public_subnet_az_2" {
    type = string
    description = "Main VPC Public Subnet Availability Zone 1"
}

variable "main_vpc_public_subnet_zone_2_cidr" {
    type = string
    description = "Main VPC Public Subnet Availability Zone CIDR Value 1"
}


variable "main_vpc_private_subnet_az_2" {
    type = string
    description = "Main VPC Private Subnet  Availability Zone 1"
}

variable "main_vpc_private_subnet_zone_2_cidr" {
    type = string
    description = "Main VPC Private Subnet Availability Zone 1 CIDR Value"
}

variable "public_instance_ami" {
    type = string
    description = "Public Instance AMI"
    default = "ami-05d2d839d4f73aafb"
  
}

variable "private_instance_ami" {
  type = string
  description = "Private Instance AMI"
  default = "ami-05d2d839d4f73aafb"
}

// Variable That Contain Names

variable "vpc_name" {
    type = string
    description = "Main VPC Name"
    default = "My_Main_VPC"
  
}


variable "public_subnet_name" {
    type = string
    description = "Name Of The Public Subnet"
    default = "public_subnet"
  
}

variable "private_subnet_name" {
    type = string
    description = "Name Of the Private Subnet"
    default = "private_subnet"
  
}

variable "internet_gateway_name" {
    type = string
    description = "Name Of The Internet Gateway"
    default = "main_igw"
}

variable "public_route_table_name" {
    type = string
    description = "Name of the Public Route Table"
    default = "public_rt"
}

variable "private_subnet_route_table_name" {
    type = string
    description = "Name of the Private Route Table"
    default = "private_rt"
}

variable "public_subnet_az2_name" {
    type = string
    description = "Public Subnet AZ2"
    default = "public-subnet-az2"
}

variable "private_subnet_az2_name" {
    type = string
    description = "Private Subnet AZ2"
    default = "private-subnet-az2"
}

variable "public_subnet_route_table_name_az2" {
    type = string
    description = "Public Subnet Route Table Name"
    default = "public_rt_az2"
}

variable "private_subnet_route_table_name_az2" {
    type = string
    description = "private Subnet Route Table Name"
    default = "private_rt_az2"
}