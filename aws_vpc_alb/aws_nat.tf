resource "aws_eip" "eip" {


}

resource "aws_nat_gateway" "nat_gateway" {
  
  subnet_id = aws_subnet.public.id
  allocation_id = aws_eip.eip.id

  tags = {
    "Name" = "my-nat"
  }
}