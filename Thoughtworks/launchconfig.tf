resource "aws_launch_configuration" "tworks-lc" {
    name_prefix = "tworks-lc-"
    image_id = "${var.ami}"
    instance_type = "${var.instance_type}"
    user_data = "${file("init-instance.sh")}"
    key_name = "${var.key_name}"
    vpc_security_group_ids =["${aws_security_groups.alb.id"}]
    lifecycle {
        create_before_destroy = true
    }

    root_block_device {
        volume_type = "standard"
        volume_size = "50"
        delete_on_termination = true
    }
}

resource aws_autoscaling_group" tworks"{
    name    ="${local.asg_name}"
    min_size = "${lower(terraform.workspace)=="prod"?3:1}"
    max_size = "${lower(terraform.workspace)=="prod"?4:1}"
    vpc_zone_identifier =["${var.subnets}"]
    health_check_type ="EC2"
    target_group_arns =[aws_lb_target_group.tworks-asg.arn]
    launch_configuration = "${aws_launch_configuration.tworks-lc.name}"
    lifecycle{
      create_before_destroy = true
}



    tag = {
        key = "Name"
        value = "Application Instance"
        propagate_at_launch = true
    }
}

resource "aws_autoscaling_policy" "tworks-scale-up" {
    name = "tworks-scale-up"
    scaling_adjustment = 1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
    autoscaling_group_name = "${aws_autoscaling_group.tworks.name}"
}

resource "aws_autoscaling_policy" "tworks-scale-down" {
    name = "tworks-scale-down"
    scaling_adjustment = -1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
    autoscaling_group_name = "${aws_autoscaling_group.tworks.name}"
}
