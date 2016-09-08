# Load balancer
resource "aws_elb" "app" {
    name = "wordpress-elb"
    subnets = ["${aws_subnet.public.id}"]
    security_groups = ["${aws_security_group.elb.id}"]
    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    instances = ["${aws_instance.web-production.*.id}"]
}
