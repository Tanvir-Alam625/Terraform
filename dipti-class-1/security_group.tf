

resource "aws_security_group" "main_sg" {

    name = "main-sg-zone-a"
    description = "Main Security Group"
    vpc_id = aws_vpc.main.id


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
}

