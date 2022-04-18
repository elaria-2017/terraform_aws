resource "aws_elasticache_subnet_group" "redis" {
  name       = "redis"
  subnet_ids = [module.network.pri_sub1_id,module.network.pri_sub2_id]
}
resource "aws_elasticache_cluster" "redis" {
  security_group_ids = [aws_security_group.private.id]
  cluster_id           = "redis"
  engine               = "redis"
  engine_version       = "3.2.10"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
}