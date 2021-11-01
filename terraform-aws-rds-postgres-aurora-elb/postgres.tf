resource "aws_db_parameter_group" "default" {
  name   = "postgres"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.1"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "root"
  password             = "foobarbaz"
  parameter_group_name = "postgres"
  db_subnet_group_name=aws_db_subnet_group.default.name
  vpc_security_group_ids=[aws_security_group.db.id]
  availability_zone=aws_subnet.private_1.availability_zone
  skip_final_snapshot    = true
}

output "end_point" {
  value = aws_db_instance.default.endpoint
}