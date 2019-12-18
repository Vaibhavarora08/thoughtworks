resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
    alarm_name = "cpu_utilization_tworks"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "System/Linux"
    period = "300"
    statistic = "Average"
    threshold = "80"
    alarm_description = "This metric monitors ec2 cpu for high utilization on hosts"
    alarm_actions = [
        "${aws_autoscaling_policy.tworks-scale-up.arn}"
    ]
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.tworks.name}"
    }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_low" {
    alarm_name = "cpu_utilization_tworks"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "System/Linux"
    period = "300"
    statistic = "Average"
    threshold = "20"
    alarm_description = "This metric monitors ec2 cpu for high utilization on hosts"
    alarm_actions = [
        "${aws_autoscaling_policy.tworks-scale-down.arn}"
    ]
    dimensions {
        AutoScalingGroupName = "${aws_autoscaling_group.tworks.name}"
    }
}