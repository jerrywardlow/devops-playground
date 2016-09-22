# Elasticache Redis cluster
resource "aws_elasticache_cluster" "redis" {
    cluster_id = "wordpress-redis"
    engine = "redis"
    node_type = "cache.t2.micro"
    port = 6379
    num_cache_nodes = 1
    parameter_group_name = "wordpress.redis2.8"
}
