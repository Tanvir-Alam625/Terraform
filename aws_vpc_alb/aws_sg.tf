resource "aws_security_group" "main_sg" {
    name = "main-sg"
    description = "Main security group"
    vpc_id = aws_vpc.main.id


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.main_sg.id
}

resource "aws_security_group_rule" "allow_http_inbound" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.main_sg.id
    
}

resource "aws_security_group_rule" "allow_https_inbound" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.main_sg.id
}

resource "aws_security_group_rule" "allow_icmp_inbound" {
    type = "ingress"
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["192.168.0.0/16"]
    security_group_id = aws_security_group.main_sg.id
}
