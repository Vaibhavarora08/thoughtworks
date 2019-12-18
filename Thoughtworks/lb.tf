resource "aws_lb" "tworks-lb"{
   name  = "${var.lb_name}"
   load_balancer_type ="application"
   subnets = "${var.subnets}"
   security_groups =[aws_security_group.alb.id]
}

resource "aws_lb_listener" "http"{
     load_balancer_arn = "${aws_lb.tworks-lb.arn}"
     port  =80
     protocol  ="HTTP"

} 

resource "aws_lb_target_group" "tworks-asg"{
  name  ="tworks-asg"
  protocol ="HTTP"
  vpc_id  = "${var.subnets}"

 }

resource_aws_lb_listener_rule" "tworks-asg"{
   listener_arn = "${aws_lb_listener.http.arn}"
    priority =100

condition{
   field  ="path-pattern"
   values =["*"]
}
 action {
    type ="forward"
    target_group_arn = "${aws_lb_target_group.tworks-asg.arn}"
}
}