resource "aws_vpc" "rds_twork" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_db_subnet_group" "rds_twork" {
  name       = "rds_twork"
  subnet_ids = ["${aws_subnet.rds_twork_a.id}", "${aws_subnet.rds_twork_b.id}", "${aws_subnet.rds_twork_c.id}"]
}

resource "aws_subnet" "rds_twork_a" {
  vpc_id     = "${aws_vpc.rds_twork.id}"
  cidr_block = "${cidrsubnet(aws_vpc.rds_twork.cidr_block, 4, var.az_number[data.aws_availability_zone.eu-central-1a.name_suffix])}"
  availability_zone = "${data.aws_availability_zone.eu-central-1a.id}"
}

resource "aws_subnet" "rds_twork_b" {
  vpc_id     = "${aws_vpc.rds_twork.id}"
  cidr_block = "${cidrsubnet(aws_vpc.rds_twork.cidr_block, 4, var.az_number[data.aws_availability_zone.eu-central-1b.name_suffix])}"
  availability_zone = "${data.aws_availability_zone.eu-central-1b.id}"
}

resource "aws_subnet" "rds_twork_c" {
  vpc_id     = "${aws_vpc.rds_twork.id}"
  cidr_block = "${cidrsubnet(aws_vpc.rds_twork.cidr_block, 4, var.az_number[data.aws_availability_zone.eu-central-1c.name_suffix])}"
  availability_zone = "${data.aws_availability_zone.eu-central-1c.id}"
}

resource "aws_security_group" "rds_twork_mysql" {
  name = "rds_twork_mysql"
  description = "RDS twork MySQL Security Group"
  vpc_id = "${aws_vpc.rds_twork.id}"
}

resource "aws_security_group_rule" "mysql_in" {
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  source_security_group_id = "${aws_security_groups.alb.id}"

  security_group_id = "${aws_security_group.rds_twork_mysql.id}"
}

resource "aws_security_group_rule" "mysql_out" {
  type            = "egress"
  from_port       = 3306
  to_port         = 3306
  protocol        = "tcp"
  source_security_group_id = "${aws_security_group.rds_twork_mysql.id}"

  security_group_id = "${aws_security_group.rds_twork_mysql.id}"
}