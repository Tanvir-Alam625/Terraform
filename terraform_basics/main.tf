terraform {
  
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
    profile = "Batch-9" 
}


resource "aws_vpc" "main_2" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main-vpc-2"
    }

}

