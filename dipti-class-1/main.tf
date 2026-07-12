terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "dipti-state-file"
    key = "devops/prod.tfstate"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "Batch-8"
}



