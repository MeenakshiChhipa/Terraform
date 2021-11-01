resource "aws_route_table" "route-public" {
  vpc_id = "${aws_vpc.vpc_demo.id}"

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "public-route-table-demo"
  }
}

resource "aws_route_table" "private1" {
  
  vpc_id = "${aws_vpc.vpc_demo.id}"

  route {
    cidr_block = "10.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat_gw1.id
  }

  tags = {
    Name = "private1"
  }
}

resource "aws_route_table" "private2" {

  vpc_id = "${aws_vpc.vpc_demo.id}"

  route {
    cidr_block = "10.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat_gw2.id
  }

  tags = {
    Name = "private2"
  }
}