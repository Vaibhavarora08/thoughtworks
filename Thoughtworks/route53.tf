resource "aws_route53_record" "tworks_nonprod"{
   zone_id = "${var.dns_zoneid}"
   name ="${lower(terraform.workspace)}.${var.dns_domain}"
   type ="A"
  
 alias{
   name  ="${aws_lb.tworks-asg.dns_name}"
   zone_id = "${aws_lb.tworks-asg.zoneid}"
}
}

resource "aws_route53_record" "tworks_prod"{
   zone_id = "${var.dns_zoneid}"
   name ="${lower(terraform.workspace)}.${var.dns_domain}"
   type ="A"
  
 alias{
   name  ="${aws_lb.tworks-asg.dns_name}"
   zone_id = "${aws_lb.tworks-asg.zoneid}"
}
}
