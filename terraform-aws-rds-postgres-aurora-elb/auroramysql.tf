
resource "aws_db_subnet_group" "auroramysql" {
  name       = "aurora"
  subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

  tags = {
    Name = "My DB subnet AuroraMYSQL group"
  }
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.t2.small"
  
  

}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-demo"  
  database_name           = "myauroradb"  
  enable_http_endpoint    = true  
  master_username         = "root"
  master_password         = "chang333eme321"
  backup_retention_period = 1
  db_subnet_group_name=aws_db_subnet_group.auroramysql.name
  vpc_security_group_ids=[aws_security_group.db2.id]
  availability_zones      = ["us-east-1b"]
  
  
  skip_final_snapshot     = true
  
  
}


output "end_point1" {
  value = aws_rds_cluster_instance.cluster_instances.endpoint
}