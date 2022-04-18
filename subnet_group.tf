resource "aws_db_subnet_group" "education" {
  name       = "education"
  subnet_ids = [module.network.pri_sub1_id,module.network.pri_sub2_id]

  tags = {
    Name = "Education"
  }
}