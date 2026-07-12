output "aws_instance_public_ip" {

    value = aws_instance.public_instance.public_ip
    description = "Public IP of the Public EC2"
}

output "aws_instance_private_ip" {
    value = aws_instance.public_instance.private_ip
    description = "Private IP of the Public EC2"
}

output "aws_instance_private_ip_of_private_ec2" {
    value = aws_instance.private_instance.private_ip
    description = "Private IP of the Private EC2"
}


output "aws_instance_private_ip_for_public_ec2_az2" {
    value = aws_instance.public_instance_az2.private_ip 
    description = "Private IP of the Public EC2 AZ2"
}

output "aws_instance_public_ip_for_public_ec2_az2" {
    value = aws_instance.public_instance_az2.public_ip
    description = "Public IP of the Public EC2 AZ2"
}



output "aws_instance_private_ip_for_private_ec2_az2" {
    value = aws_instance.private_instance_az_2.private_ip 
    description = "Private IP of the Private EC2 AZ2"
}

