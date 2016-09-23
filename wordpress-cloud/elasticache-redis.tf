# ElastiCache Redis cluster
resource "aws_elasticache_cluster" "redis" {
    cluster_id = "wordpress-redis"
    engine = "redis"
    node_type = "cache.t2.micro"
    port = 6379
    num_cache_nodes = 1
    parameter_group_name = "${aws_elasticache_parameter_group.wordpress.name}"
    security_group_ids = ["${aws_security_group.redis.id}"]
    subnet_group_name = "${aws_elasticache_subnet_group.default.name}"
}

# ElastiCache subnet group
resource "aws_elasticache_subnet_group" "default" {
    name = "wordpress-redis-subnet-group"
    description = "Subnet group for ElastiCache/Redis - Zones 2b and 2c"
    subnet_ids = ["${aws_subnet.rds1.id}", "${aws_subnet.rds2.id}"]
}

# ElastiCache parameter group
resource "aws_elasticache_parameter_group" "wordpress" {
    name = "wordpress-redis"
    family = "redis2.8"
}
