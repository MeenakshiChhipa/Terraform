resource "aws_subnet" "public_1" {
  availability_zone = "us-east-1a"
  vpc_id     = aws_vpc.vpc_demo.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_1-demo"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.vpc_demo.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public_2-demo"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_1" {
  availability_zone = "us-east-1a"
  vpc_id     = aws_vpc.vpc_demo.id
  map_public_ip_on_launch = false
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "private_1-demo"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_2" {
  availability_zone = "us-east-1b"
  vpc_id     = aws_vpc.vpc_demo.id
  map_public_ip_on_launch = false
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "private_2-demo"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}