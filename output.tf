output "region" {
  value = "${var.region}"
}

output "technogise_vpc_id" {
  value = "${aws_vpc.technogise_vpc.id}"
}

output "technogise_public_sn_01_id" {
  value = "${aws_subnet.technogise_public_sn_01.id}"
}

output "technogise_public_sn_02_id" {
  value = "${aws_subnet.technogise_public_sn_02.id}"
}

output "technogise_public_sg_id" {
  value = "${aws_security_group.technogise_public_sg.id}"
}

output "ecs-service-role-arn" {
  value = "${aws_iam_role.ecs-service-role.arn}"
}

output "ecs-instance-role-name" {
  value = "${aws_iam_role.ecs-instance-role.name}"
}

output "app-alb-load-balancer-name" {
  value = "${aws_alb.technogise_alb_load_balancer.name}"
}

output "app-alb-load-balancer-dns-name" {
  value = "${aws_alb.technogise_alb_load_balancer.dns_name}"
}



output "technogise-app-target-group-arn" {
  value = "${aws_alb_target_group.technogise_app_target_group.arn}"
}


output "mount-target-dns" {
  description = "Address of the mount target provisioned"
  value = "${aws_efs_mount_target.technogisedbefs-mnt.0.dns_name}"
}
