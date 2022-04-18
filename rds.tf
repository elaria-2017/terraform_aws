resource "aws_db_instance" "db" {
  allocated_storage = 5
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  username = "admin"
  password = "adminadmin"
  db_subnet_group_name   = aws_db_subnet_group.education.name
  vpc_security_group_ids = [aws_security_group.private.id]
  parameter_group_name = "default.mysql5.7"
  publicly_accessible    = true

}
