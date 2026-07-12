


module "web_server" {
    
    count = 100

    source = "../ec2/"
    aws_ami_ubuntu = "api-1233445"
    aws_instance_name = "web-$(count.index)"
}



module "web_server" {
    
    for_each = {

        dev = "t2.small"
        test = "t3.micro"
        prod = "t3.medium"

    }

    source = "../ec2/"

    aws_ami_ubuntu = "api-1233445"
    aws_instance_name = each.key
    instance_type = each.value
}



resource "" "name" {
  
}