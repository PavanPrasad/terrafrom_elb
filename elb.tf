# Create a new load balancer
resource "aws_elb" "terra-elb" {
  name               = "terra-elb"
  #availability_zones = ["${var.azs}"]
  subnets = ["subnet-024707fd2244a8a93","subnet-05616efb02263b23d"]
  security_groups = ["${aws_security_group.webservers.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }


  instances                   = ["{aws_instance.webservers.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

}

output "elb-dns-name" {
  value = "${aws_elb.terra-elb.dns_name}"
}
